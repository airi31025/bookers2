class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end

  def index
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
      flash[:success] = 'You have updated user successfully'
      redirect_to user_path(@user)
    else
      render:edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:title,:body,:profile_image)
  end

end
