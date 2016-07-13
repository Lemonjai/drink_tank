class BookmarksController < ApplicationController
  before_action :get_drink, only: [:create]

  def create
  	@bookmark = @drink.bookmarks.build
  	@bookmark.user = current_user
  	if @bookmark.save
  		redirect_to drink_path(@drink), notice: 'Bookmark created successfully'
  	else
      flash[:alert] = "Bookmark failed to save."
  		redirect_to drink_path(@drink)
  	end
  end

  def destroy
  	@bookmark = Bookmark.find(params[:id])
  	if @bookmark.destroy
      redirect_to user_path(current_user), notice: "Bookmark deleted"
    else
      redirect_to user_path(current_user)
      flash[:alert] = "Deleting bookmark failed"
    end
  end

  private
  def get_drink
    @drink = Drink.find(params[:drink_id])
  end
end
