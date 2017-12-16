class UsersController < ApplicationController
 before_action :set_user, only: [:update,:edit]
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: '更新できました'
    else

      render 'edit', alert: '更新できません'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
