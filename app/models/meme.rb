class Meme < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :creator, class_name: User

  ###################################

  validates :image, presence: true
  validates :text, presence: true
  validates_length_of :text, :minimum => 1, :maximum => 12
  validates_length_of :meme_addy, :minimum => 34, :maximum => 34, :allow_blank => true
  
  default_scope -> {order('created_at desc')}

  end


