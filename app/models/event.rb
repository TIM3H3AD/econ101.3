class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :creator, class_name: User
  attr_accessor :the_day
    ###################################

  validates :image, presence: true
  validates :title, presence: true
  validates :the_day, presence: true
  validates :description, presence: true, length: {maximum: 255}
  validates :location, presence: true, length: {maximum: 30}
  validates :location_street_number, presence: true, length: {maximum: 30}
  validates :location_street_name, presence: true, length: {maximum: 30}
  validates :location_zip, presence: true, length: {maximum: 30}
  default_scope -> {order('the_day asc')}

  end
