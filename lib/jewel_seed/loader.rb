module JewelSeed
  class Loader
    class << self
      def tables
        only = ENV['ONLY'].split(',') unless ENV['ONLY'].nil?
        except = ENV['EXCEPT'].split(',') unless ENV['EXCEPT'].nil?
        @tables = SeedMigrationTable.table_names
        @tables.select! { |x| only.include?(x) } unless only.nil?
        @tables.reject! { |x| except.include?(x) } unless except.nil?
        @tables
      end

      def load
        tables.each do |t|
          path = "#{SEED_PATH}/#{t}.rb"
          require(File.expand_path(path))
        end
      end
    end
  end
end
