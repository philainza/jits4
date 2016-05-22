class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true

  validates :last_name, presence: true

  has_many :registrations, dependent: :destroy
  has_many :open_mats
  has_many :activities
  has_many :albums
  has_many :pictures
  has_many :posts
  has_many :user_friendships
  has_many :friends, -> { where(user_friendships: { state: "accepted"}) }, through: :user_friendships

  has_many :pending_user_friendships, -> { where({ state: "pending" }) }, class_name: 'UserFriendship',
                                      foreign_key: :user_id

  has_many :pending_friends, through: :pending_user_friendships, source: :friend
  has_many :requested_user_friendships, -> {where({state: "requested"})},class_name: 'UserFriendship',
    foreign_key: :user_id

  has_many :requested_friends, through: :pending_user_friendships, source: :friend
  has_many :blocked_user_friendships, -> {where({state: "blocked"})},class_name: 'UserFriendship',
    foreign_key: :user_id

  has_many :blocked_friends, through: :pending_user_friendships, source: :friend
  has_many :accepted_user_friendships, -> { where({state: "accepted"}) },                                    class_name: 'UserFriendship',
                                        foreign_key: :user_id
  has_many :accepted_friends, through: :pending_user_friendships, source: :friend

  has_attached_file :avatar, styles: {
    medium: '200x200#',
    small: '140x140#',
    thumb: '64x64#',
  },
    default_url: "default-profile.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  

  def full_name
    first_name + " " + last_name
  end

  def has_blocked?(other_user)
    blocked_friends.include?(other_user)
  end

  def create_activity(item, action)
    activity = activities.new
    activity.targetable = item
    activity.action = action
    activity.save
    activity
  end
end
