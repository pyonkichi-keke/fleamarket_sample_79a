class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def create
    Product.create(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :user_id)
  end
end
