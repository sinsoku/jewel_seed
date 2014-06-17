require 'active_record'
require 'active_support/all'
require 'activerecord-import'

require "jewel_seed/version"
require 'jewel_seed/railtie' if defined? Rails
require 'jewel_seed/migration'
require 'jewel_seed/migration_proxy'
require 'jewel_seed/models/seed_migration'
require 'jewel_seed/models/seed_migration_table'
require 'jewel_seed/migrator'
require 'jewel_seed/dumper'
require 'jewel_seed/loader'

module JewelSeed
  SEED_PATH = 'db/seeds'
  SEED_MIGRATE_PATH = 'db/seed_migrate'

  delegate :migrate, :rollback, to: Migrator
  delegate :dump, to: Dumper
  delegate :load, to: Loader

  class << self
    def seed_tables
      SeedMigrationTable.table_name
    end
  end
end
