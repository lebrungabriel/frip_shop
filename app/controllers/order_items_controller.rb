class OrderItemsController < ApplicationController

  def index
    @order_items = OrderItem.all
  end

  # def new
  #   @order_item = Order_item.new
  #   @product = product.find(params[:product_id])
  # end

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
    # @order_item.destroy

    if @order_item.destroy
      redirect_to order_items_path
    end
  end


  # private

  # def order_items_params
  #   params.require(:order_item).permit(:created_at, :price)
  # end
end
