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

      def migrate
        targets = migrations.select { |m| m.version > current_version }.sort { |a, b| a.version <=> b.version }
        targets.each do |migration|
          ActiveRecord::Base.transaction do
            migration.up
          end
        end
      end

      def rollback
        step = ENV['STEP'].to_i
        step = 1 if step.zero?

        targets = migrations.select { |m| m.version <= current_version }.sort { |a, b| b.version <=> a.version }.first(step)
        targets.each do |migration|
          ActiveRecord::Base.transaction do
            migration.down
          end
        end
      end
    end
  end
end
