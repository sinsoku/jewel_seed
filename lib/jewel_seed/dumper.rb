module JewelSeed
  class Dumper
    class << self
      def tables
        only = ENV['ONLY'].split(',') unless ENV['ONLY'].nil?
        except = ENV['EXCEPT'].split(',') unless ENV['EXCEPT'].nil?
        @tables = SeedMigrationTable.table_names
        @tables.select! { |x| only.include?(x) } unless only.nil?
        @tables.reject! { |x| except.include?(x) } unless except.nil?
        @tables
      end

      def dump
        Dir.mkdir(SEED_PATH) unless File.exist?(SEED_PATH)

        tables.each do |t|
          dump_table(t)
        end
      end

      def dump_table(table)
        klass = table.classify.constantize
        columns = klass.column_names.delete_if { |c| ['created_at', 'updated_at'].include? c }
        open("db/seeds/#{table}.rb", 'w') do |stream|
          stream.puts "ActiveRecord::Base.transaction do"
          stream.puts "#{klass}.delete_all"
          stream.puts "#{klass}.import("
          stream.puts "#{columns},["
          klass.find_each do |record|
            stream.puts "#{record.attributes.values_at(*columns)},"
          end
          stream.puts "])"
          stream.puts "end"
        end
      end
    end
  end
end
