class BookmarksController < ApplicationController
  before_action :get_drink, only: [:create]

  def create
  	@bookmark = @drink.bookmarks.build
  	@bookmark.user = current_user
  	if @bookmark.save
  		redirect_to drink_path(@drink), notice: 'Bookmark created successfully'
  	else
  		render 'drinks/show'
  	end
  end

  def destroy
  	@bookmark = Bookmark.find(params[:id])
  	if @bookmark.destroy
      redirect_to drink_path(@drink), notice: "Bookmark deleted"
    else
      redirect_to drink_path(@drink)
      flash[:alert] = "Deleting bookmark failed"
    end
  end

  private
  def get_drink
    @drink = Drink.find(params[:event_id])
  end
end
