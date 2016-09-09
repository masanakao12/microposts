class SessionsController < ApplicationController
  def new
  end
  
  def show
   @user = User.find(params[:id])
 end
 
  def edit
  end
  
  def update
  @user = User.find(params[:id])
   if @message.update(message_params)
     # 保存に成功した場合はトップページへリダイレクト
     redirect_to user_path(@user) , notice: 'プロフィールを更新しました'
   else
     # 保存に失敗した場合は編集画面へ戻す
     render 'edit'
   end
 end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end