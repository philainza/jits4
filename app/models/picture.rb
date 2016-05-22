class Picture < ActiveRecord::Base
  belongs_to :album
  belongs_to :user

  has_attached_file :asset, styles: {
    large: '300x300>',
    medium: '200x200#',
    small: '140x140#',
    thumb: '64x64#'
  }
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

end
