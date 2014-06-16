module JewelSeed
  class Migrator
    class << self
      def setup
        SeedMigration.create_table unless SeedMigration.table_exists?
        SeedMigrationTable.create_table unless SeedMigrationTable.table_exists?
      end

      def migration_files
        Dir["#{SEED_MIGRATE_PATH}/[0-9]*_*.rb"]
      end

      def migrations
        migration_files.map { |f| MigrationProxy.new(f) }
      end

      def current_version
        SeedMigration.current_version.to_i
      end

      def target_migrations
        migrations.select { |m| m.version > current_version }
      end

      def migrate
        target_migrations.each do |migration|
          ActiveRecord::Base.transaction do
            migration.up
          end
        end
      end

      def rollback
        migration = migrations.find { |m| m.version == current_version }

        ActiveRecord::Base.transaction do
          migration.down
        end
      end
    end
  end
end
