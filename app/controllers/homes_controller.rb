class HomesController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.includes(:images).order('created_at DESC')
  end
end
