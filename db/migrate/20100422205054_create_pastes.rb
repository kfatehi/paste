class CreatePastes < ActiveRecord::Migration
  def self.up
    create_table :pastes do |t|
      t.string :title
      t.string :language
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :pastes
  end
end
