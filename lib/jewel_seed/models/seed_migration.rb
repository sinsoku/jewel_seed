module JewelSeed
  class SeedMigration < ActiveRecord::Base
    has_many :seed_migration_tables, dependent: :delete_all
    scope :sorted_version, -> { order(arel_table[:version].asc) }
    scope :loading_tables, -> { includes(:seed_migration_tables) }

    class << self
      def current_version
        order(arel_table[:version].desc).pluck(:version).first
      end

      def create_table
        CreateSeedMigration.new.migrate(:up)
      end

      def drop_table
        CreateSeedMigration.new.migrate(:down)
      end
    end
  end

  class CreateSeedMigration < ActiveRecord::Migration
    def change
      create_table :seed_migrations do |t|
        t.string :version, null: false
        t.timestamps
      end
      add_index :seed_migrations, :version, unique: true
    end
  end
end
