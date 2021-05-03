class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @products = Product.all

    if params[:query].present?
      @products = @products.global_search(params[:query])
    end

    if params[:category].present?
      @products = @products.global_search(params[:category])
    end

    if params[:gender].present?
      @products = @products.where(gender: params[:gender])
    end

    if params[:color].present?
      @products = @products.where(color: params[:color])
    end

    if params[:price].present?
      @products = @products.where(price: params[:price])
    end

    if params[:size].present?
      @products = @products.where(size: params[:size])
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @user = current_user
    @product.user = @user
  end

  def create
    @product = Product.new(product_params)
    @user = current_user
    @product.user = @user

    if @product.save
      redirect_to products_path
    else
      redirect_to order_items_path
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :price, :category, :description, :gender, :color, :size)
  end
end
