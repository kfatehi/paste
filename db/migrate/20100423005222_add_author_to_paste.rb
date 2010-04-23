class AddAuthorToPaste < ActiveRecord::Migration
  def self.up
    add_column :pastes, :author, :string
  end

  def self.down
    remove_column :pastes, :author
  end
end

