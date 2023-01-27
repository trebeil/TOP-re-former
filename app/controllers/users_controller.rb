class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #@user = User.new(email: params[:email], username: params[:username], password: params[:password])
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'User successfully created!'
      redirect_to new_user_path
    else
      flash.now[:error] = 'Please review your inputs and try again.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      flash[:success] = 'User successfully updated!'
      redirect_to edit_user_path(params[:id])
    else
      flash.now[:error] = 'Please review your inputs and try again.'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
