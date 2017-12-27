class WelcomeController < ApplicationController

  def index
  @memes = Meme.all
  @offers = Offer.all
  @events = Event.all
  end
 
end
