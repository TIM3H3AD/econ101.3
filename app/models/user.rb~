class User < Patron
  devise :invitable, :registerable, :confirmable
  has_many :created_memes, class_name: Meme, foreign_key: :creator_id, :dependent => :destroy
  has_many :created_offers, class_name: Offer, foreign_key: :creator_id, :dependent => :destroy
  has_many :created_events, class_name: Event, foreign_key: :creator_id, :dependent => :destroy
 end
