module JewelSeed
  class Loader
    class << self
      def load
        SeedMigrationTable.table_names.each do |t|
          path = "#{SEED_PATH}/#{t}.rb"
          require(File.expand_path(path))
        end
      end
    end
  end
end
