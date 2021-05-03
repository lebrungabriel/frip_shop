class LikedItemsController < ApplicationController
  def index
    @liked_items = LikedItem.all
    @liked_items = current_user.liked_items
  end

  def create
    @liked_item = LikedItem.new(product: Product.find(params[:product_id]))
    @liked_item.user = current_user

    if @liked_item.save
      redirect_to product_path
    end
  end

  def destroy
    @liked_item = LikedItem.find(params[:id])
    @liked_item.user = current_user

    if @liked_item.destroy
      redirect_to liked_items_path
    end
  end
end
