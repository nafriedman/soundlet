class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]

  def index
    @listings = policy_scope(Listing).order(created_at: :desc)
  end

  def new
    @listing = Listing.new
    authorize(@listing)
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize(@listing)
    if @listing.save!
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
  end

  def my_listings

  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :category, :photo)
  end

  def set_listing
    @listing = Listing.find(params[:id])
    authorize(@listing)
  end
end
