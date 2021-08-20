class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]

  def index
    @listings = policy_scope(Listing).order(created_at: :desc)
    if params[:query].present?
      @listings = Listing.search_by_name_description_and_category(params[:query])
    else
      @listings = Listing.all
    end
  end

  def new
    @listing = Listing.new
    authorize(@listing)
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.available = true
    authorize(@listing)
    if @listing.save!
      redirect_to my_listings_path(current_user)
    else
      render :new
    end
  end

  def show
    @rental = Rental.new
  end

  def my_listings
    @listings = Listing.where(user: current_user)
    authorize(@listings)
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :category, :image)
  end

  def set_listing
    @listing = Listing.find(params[:id])
    authorize(@listing)
  end
end
