class RentalsController < ApplicationController
  before_action :set_rental, only: [:update]
  before_action :set_listing, except: [:index]

  def index
    @rentals = policy_scope(Rental).where(user: current_user)
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

  def update
    if @rental.update(rental_params)
      redirect_to :listing_rentals, notice: 'Status updated successfully!'
    end
    authorize(@rental)
  end
  
  def listing_rentals
    @rentals = policy_scope(Rental)
    authorize(@rentals)
  end

  private

  def set_rental
    @rental = Rental.find(params[:rental][:rental_id])
  end

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def rental_params
    params.require(:rental).permit(:from, :until, :status, :user_id, :listing_id)
  end

end
