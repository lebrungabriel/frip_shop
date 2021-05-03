class OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.all
    @order_items = current_user.order_items
  end

  def create
    @order_item = OrderItem.new(product: Product.find(params[:product_id]))
    @order_item.user = current_user

    if @order_item.save
      redirect_to product_path(@order_item.product)
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.user = current_user

    if @order_item.destroy
      redirect_to order_items_path
    end
  end
end
