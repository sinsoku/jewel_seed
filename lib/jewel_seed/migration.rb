module JewelSeed
  class Migration
    attr_reader :table_names

    def initialize
      @table_names = []
    end

    def seed(*args, **opts)
      models = args.first
      klass = models.first.class
      table_name = klass.table_name
      @table_names << table_name
      puts " - #{klass}"
      models.each { |model| puts model.inspect }
      delete_ids = models.map(&:id).uniq.compact
      klass.delete_all(id: delete_ids)
      klass.import(*args, opts)
    end

    def up
      raise NotImplementedError
    end

    def down
      raise NotImplementedError
    end
  end
end
