namespace :jseed do
  desc 'Setup databases for JewelSeed'
  task install: :environment do
    JewelSeed::Migrator.setup
    Rake::Task['db:_dump'].invoke
  end

  desc 'Migrate seed files'
  task migrate: :environment do
    JewelSeed::Migrator.migrate
  end

  desc 'Rollback seed files. (options: STEP=n)'
  task rollback: :environment do
    JewelSeed::Migrator.rollback
  end

  desc 'Create db/seeds/*.rb files. (options: ONLY=users,devices EXCEPT=cartridges)'
  task dump: :environment do
    JewelSeed::Dumper.dump
  end

  desc 'Load db/seeds/*.rb files into the database (options: ONLY=users,devices EXCEPT=cartridges)'
  task load: :environment do
    JewelSeed::Loader.load
  end

  desc 'Show the current seed version'
  task version: :environment do
    puts "Current version: #{JewelSeed::SeedMigration.current_version}"
  end

  desc 'Show all seed versions'
  task versions: :environment do
    JewelSeed::SeedMigration.loading_tables.sorted_version.each do |seed_migration|
      tables = seed_migration.seed_migration_tables.pluck(:table_name)
      puts "#{seed_migration.version} #{tables.join(' ')}"
    end
  end
end
