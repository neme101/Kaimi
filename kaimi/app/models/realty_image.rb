class RealtyImage < ActiveRecord::Base
  belongs_to :realty

  # paperclip
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100",
      :small  => "150x150"
    },
    :path => ":rails_root/public/uploads/realty/:attachment/:id/:style/:filename",
    :url => "/uploads/realty/:attachment/:id/:style/:filename"
end
