class Group < ApplicationRecord
  validates :name, presence: true
  has_many :chats, dependent: :destroy
  has_many :user_groups
  has_many :users, through: :user_groups, dependent: :destroy
  mount_uploader :avator, UserAvatorUploader
end
