class Offer < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :creator, class_name: User

  ###################################

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: {maximum: 255}
  validates :title, presence: true
  validates :contact, presence: true

  default_scope -> {order('title asc')}

  end

