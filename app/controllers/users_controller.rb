class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def renewal
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "プロフィールを編集しました"
      redirect_to root_path
    else
      render "edit"
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
