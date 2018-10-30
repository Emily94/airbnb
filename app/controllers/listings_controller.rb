class ListingsController < ApplicationController
  def index
  end

  def show
    
  end

  def create
    @listing = Listing.new (params[:listing])
 
    @listing.save
    redirect_to @listing

    private
      def article_params
      params.require(:listing).permit(:title, :description)
    end
  end
end
