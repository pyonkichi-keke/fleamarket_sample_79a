class ItemsController < ApplicationController
  def index
    # @products = Product.all.includes(:images)
    @products = Product.order('created_at DESC').limit(5)
    @images = Image.all
  end
end
