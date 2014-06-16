class <%= file_name.camelize %> < JewelSeed::Migration
  def up
    # Example import using ActiveRecord Models
    #
    # users = [
    #   User.new(id: 1, name: 'nanoha'),
    #   User.new(id: 2, name: 'fate')
    # ]
    # seed users
  end

  def down
    # Example simple delete records
    #
    # User.delete_all(id: [1, 2])
  end
end
