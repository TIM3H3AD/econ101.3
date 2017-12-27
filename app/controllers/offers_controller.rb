class OffersController < ApplicationController

  def new
    @offer = Offer.new
  end

  def create
      @offer = current_user.created_offers.build(offer_params)
      if @offer.save
      flash[:success] = "You have added a new Offer!"
      redirect_to @offer #things_path later
    else
      flash[:danger] = "The form contains errors"
      render :new
    end
  end

  def index
  @posts = current_user.offers
  end

  def show
  @offer = Offer.find(params[:id])
  end

  def edit
@user = current_user
  @offer = Offer.find(params[:id])
  end

  def update
  @user = current_user
  @offer = Offer.find(params[:id])  
  if @offer.update_attributes(offer_params)
      flash[:success] = "Update successful"
      redirect_to @offer
    else
      flash[:danger] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    if @offer.destroy
      flash[:success] = "Your Offer was deleted successfully"
      redirect_to root_url
    else
      flash[:danger] = "Could not delete"
      render @offer
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:creator_id, :image, :title, :hashtags, :description, :url_link, :contact, :meme_addy, :price_meme)
  end

  def correct_user
  @offer = Offer.find(params[:id])
    if current_user != @offer.creator
      flash[:danger] = "You don't have permission to do that."
      redirect_to root_url
    end
  end
end
