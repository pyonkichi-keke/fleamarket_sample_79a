class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.includes(:images).order('created_at DESC').limit(4)
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
    @user = User.find_by(id: @product.user_id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  def search
    @products = Product.search(params[:keyword])
    respond_to do |format|
      format.json
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :price, :text, :status_id, :size_id, :prefecture_id, :delivery_id, :deliverytime_id, :brand_id, :category_id, images_attributes:  [:image, :_destroy, :id]).merge(user_id: current_user.id, buy_user_id: current_user.id )
  end
end
