module JewelSeed
  module Generators
    class SeedGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      namespace :jseed

      def create_seed_file
        timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
        template 'seed.rb', "#{SEED_MIGRATE_PATH}/#{timestamp}_#{file_name}.rb"
      end
    end
  end
end
