class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    Product.create(product_params)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :price, :text, :status_id, :size_id, :prefecture_id, :delivery_id, :delivery_time_id, :brand_id, :category_id, images_attributes:  [:image, :_destroy, :id]).merge(user_id: current_user.id, buy_user_id: current_user.id )
  end
end
