class HomesController < ApplicationController
  def new
    @book = Book.new
  end
end
