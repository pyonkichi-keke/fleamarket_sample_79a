class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報の更新が完了しました！"
      # session[:user_id] = @user.id unless current_user
      sign_in(@user)
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to edit_user_path(current_user.id)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :family_name,
      :family_name_kana,
      :first_name,
      :first_name_kana,
      :nickname,
      :introdaction,
      :email,
      :birth_day,
      :encrypted_password,
      :password
    )
  end
end
