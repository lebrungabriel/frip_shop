class ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:query].present?
      @products = @products.global_search(params[:query])
    else
      @products
    end

    if params[:category].present?
      @products = @products.global_search(params[:category])
    else
      @products
    end

  end

  def show
    @product = Product.find(params[:id])
  end
end
