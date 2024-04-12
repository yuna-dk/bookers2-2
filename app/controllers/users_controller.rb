class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "An error has occurred.Please try again later"
      render :new
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params_update)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash.now[:notice] = "An error has occurred.Please try again later"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def user_params_update
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
