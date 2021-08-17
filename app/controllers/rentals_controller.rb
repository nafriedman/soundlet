class RentalsController < ApplicationController
  before_action :set_rental, only: [:edit]
  before_action :set_listing, except: [:index]
  
  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end
  
  def create
    #TODO
  end

  def edit
  end

  def update
    #TODO
  end

  def listing_rentals
    #TODO
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def rental_params
    params.require(@rental).permit(:from, :until, :status, :user_id, :listing_id)
  end

end
