class Customer::HomesController < ApplicationController

  def top
    @genres = Genre.where(is_active: "有効")
    @products = Product.where(genre_id: Genre.where(is_active: "有効")).last(4)
  end

  def about
  end

end
