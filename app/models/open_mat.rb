class OpenMat < ActiveRecord::Base
  belongs_to :user

  validates :location, :starts_at, presence: true

  has_attached_file :asset, styles: {
    large: '400x400>',
    medium: '300x300>',
    small: '140x140',
    thumb: '64x64!'
  }
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  has_many :registrations, dependent: :destroy

  def expired?
    starts_at < Time.now
  end

  def self.upcoming
    where("starts_at >= ?", Time.now).order("starts_at")
  end
end