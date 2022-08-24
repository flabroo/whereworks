class BookingsController < ApplicationController
  before_action :set_listing, only: %i[create new]

  # def create
  #   @booking = Booking.new(booking_params)
  #   @booking.listing = @listing
  #   if @booking.listing = @listing
  #     redirect_to listing_path(@listing)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def new
  #   @booking = Booking.new
  # end



  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end



private

  # def set_listing
  #   @listing = Listing.find(params[:listing_id])
  # end

  def booking_params
    params.require(:booking).permit(:quantity, :reservation_startdatetime, :reservation_enddatetime)
  end
end
