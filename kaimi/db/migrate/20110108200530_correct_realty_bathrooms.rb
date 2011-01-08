class CorrectRealtyBathrooms < ActiveRecord::Migration
  def self.up
    change_table :realties do |t|
      t.rename :bathroos, :bathrooms
    end
  end

  def self.down
    change_table :realties do |t|
      t.rename :bathroos, :bathrooms
    end
  end
end
