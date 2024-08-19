class AddDefaultTagsToTags < ActiveRecord::Migration[5.2]
  def up
    Tag.create(name: 'red')
    Tag.create(name: 'blue')
    Tag.create(name: 'green')
    Tag.create(name: 'mono')
  end

  def down
    Tag.where(name: ['red', 'blue', 'green', 'mono']).destroy_all
  end
end