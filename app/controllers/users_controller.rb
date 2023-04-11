class UsersController < ApplicationController
  def index
    @user=User.new
    @book=Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :user_image)
  end
  
  def is_matching_login_user
    user = Use.find(params[:id])
    unless user.id == current_user.id
      redirect_to sign_in_path
    end
  end
  
end
