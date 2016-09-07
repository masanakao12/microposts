class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
     # 保存に成功した場合はトップページへリダイレクト
     redirect_to root_path , notice: 'プロフィールを更新しました'
    else
     # 保存に失敗した場合は編集画面へ戻す
     render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name , :email , :password,
                                 :password_confirmation)
  end
end
