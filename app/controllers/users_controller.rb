class UsersController < ApplicationController
  before_action :correct_user ,only: [:edit,:update]
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
    def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user 
    else
      render 'new'
    end
  end
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
     # 保存に成功した場合はトップページへリダイレクト
     redirect_to @user , notice: 'プロフィールを更新しました'
    else
     # 保存に失敗した場合は編集画面へ戻す
     render 'edit'
    end
  end
  
  private
  
  def correct_user
    @user= User.find(params[:id])
    
    if current_user != @user
      redirect_to root_url
    end
  end
  
  def user_params
    params.require(:user).permit(:name , :email , :password,
                                 :password_confirmation, :location)
  end
end
