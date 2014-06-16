module JewelSeed
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'jewel_seed/tasks/jewel_seed.rake'
    end
  end
end
