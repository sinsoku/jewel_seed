module JewelSeed
  class SeedMigrationTable < ActiveRecord::Base
    belongs_to :seed_migration

    class << self
      def table_names
        pluck(:table_name).uniq
      end

      def create_table
        CreateSeedMigrationTable.new.migrate(:up)
      end

      def drop_table
        CreateSeedMigrationTable.new.migrate(:down)
      end
    end
  end

  class CreateSeedMigrationTable < ActiveRecord::Migration
    def change
      create_table :seed_migration_tables do |t|
        t.references :seed_migration, index: true, null: false
        t.string :table_name
        t.timestamps
      end
    end
  end
end
