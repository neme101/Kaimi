class CreateRealties < ActiveRecord::Migration
  def self.up
    create_table :realties do |t|
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.integer :bathroos
      t.integer :rooms
      t.decimal :size
      t.text :other_facilities
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :realties
  end
end
