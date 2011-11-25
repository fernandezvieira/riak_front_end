class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.int :key
      t.text :body
      t.string :node

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
