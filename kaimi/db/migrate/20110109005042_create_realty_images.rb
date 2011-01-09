class CreateRealtyImages < ActiveRecord::Migration
  def self.up
    create_table :realty_images do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :realty_images
  end
end
