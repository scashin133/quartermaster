class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :purchases
  end
end
