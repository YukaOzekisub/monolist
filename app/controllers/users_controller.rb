class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:show]
   
   def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      regirect_to @user
      return
    end
    
    flash.now[:danger] = 'ユーザの登録に失敗しました。'
    render :new
  end
  
  private
  
  def user_params
    params.requore(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
