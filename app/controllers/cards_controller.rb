class CardsController < ApplicationController
  def new
    @categories = Category.all
  end
end
