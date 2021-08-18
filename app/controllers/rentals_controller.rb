class RentalsController < ApplicationController
  before_action :set_rental, only: [:edit]
  before_action :set_listing, except: [:index]
  
  def index
    @rentals = policy_scope(Rental)
  end
  
  def create
    @rental = Rental.new(rental_params)
    @rental.listing = @listing
    @rental.user = current_user
    if @rental.save!
      redirect_to rentals_path
    else
      render 'listings/show'
    end
    authorize(@rental)
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
    params.require(:rental).permit(:from, :until, :status, :user_id, :listing_id)
  end

end
