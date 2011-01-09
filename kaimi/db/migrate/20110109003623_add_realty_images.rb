class AddRealtyImages < ActiveRecord::Migration
  def self.up
    create_table :realty_images do |t|
      t.string :photo_file_name         # Original filename
      t.string :photo_content_type      # Mime type
      t.integer :photo_file_size        # File size in bytes
      t.integer :realty_id
    end
  end

  def self.down
    drop_table :realty_image
  end
end
