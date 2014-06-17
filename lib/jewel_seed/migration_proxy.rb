module JewelSeed
  class MigrationProxy
    attr_reader :version, :name

    def initialize(file_name)
      @file_name = file_name
      version, name = @file_name.scan(/([0-9]+)_([_a-z0-9]*)\.rb/).first
      @version = version.to_i
      @name = name.camelize
    end

    def up
      migration.up
      fail 'seed method not called' if migration.seed_count.zero?

      seed_migration = SeedMigration.create!(version: version)
      seed_migration_tables = migration.table_names.map do |t|
        SeedMigrationTable.new(seed_migration: seed_migration, table_name: t)
      end
      SeedMigrationTable.import(seed_migration_tables)
    end

    def down
      migration.down

      seed_migration = SeedMigration.find_by(version: version)
      seed_migration.destroy
    end

    def migration_class
      name.constantize
    end

    def migration
      @migration ||= load_migration
    end

    def load_migration
      require(File.expand_path(@file_name))
      migration_class.new
    end
  end
end
