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
  end

  def show
    @product = Product.find(params[:id])
  end
end
