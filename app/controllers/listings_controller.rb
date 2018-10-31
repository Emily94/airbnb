class ListingsController < ApplicationController
  before_action :require_login, :only => [:new, :create, :edit, :update]

 
  def index
    
  end
  
  def index
    @listings = Listing.all
  end
 
  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to @listing
    else
      render 'new'
    end
  end

  def update
    @listing = Listing.find(params[:id])
   
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end


  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
  
    redirect_to listings_path
  end
  

  private


	def listing_params
		params.require(:listings).permit(:property_name, :property_type, :description, :max_guest_number, :country, :city, :price) 
	end
  

end
