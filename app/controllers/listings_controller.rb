class ListingsController < ApplicationController
  def index
    @listings = policy_scope(Listing).order(created_at: :desc)
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save!
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def my_listings

  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :category, :photo)
  end
end
