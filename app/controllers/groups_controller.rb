class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを登録しました"
    else
      render :new, alert: "グループを登録できませんでした"
    end
  end

  def edit
  end

  def update

  end

  private

  def group_params
    params.require(:group).permit(:name,  user_ids:
     [] )
  end
end
