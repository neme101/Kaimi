class Realty < ActiveRecord::Base
  
  has_many :realty_images
  
  accepts_nested_attributes_for :realty_images, :allow_destroy => true
  
  def self.featured
    # TODO "featured" algorithm
    return Realty.limit(6)
  end
end
