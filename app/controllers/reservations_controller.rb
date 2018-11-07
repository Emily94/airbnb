class ReservationsController < ApplicationController

    def new
    	@listing = Listing.find(params[:listing_id])
    end

  
    def create  	   

        @reservation = Reservation.new(reservation_params)
    	  @reservation.user_id = current_user.id
      	@reservation.listing_id = (params[:listing_id])
    	  @listing = Listing.find(params[:listing_id])
        
  		if @reservation.save
			render 'new'
        end

     end

    def show
  	   @reservation = Reservation.find(params[:id])
    end


    	
	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to "/users/#{current_user.id}"
	end


	private
	def reservation_params
		params.require(:reservations).permit(:check_in, :check_out) 
	end
 

end

