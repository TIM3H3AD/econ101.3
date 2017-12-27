class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  @user = current_user	  
  @memes = Meme.all
  @offers = Offer.all
  @events = Event.all
  @created_memes = @user.created_memes
  @created_offers = @user.created_offers
  @created_events = @user.created_events
  end

end