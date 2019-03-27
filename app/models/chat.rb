class Chat < ApplicationRecord
  validates :chat, presence: true, unless: :image?
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ChatImageUploader
end
