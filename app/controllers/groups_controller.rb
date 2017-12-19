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
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: '更新できました'
    else
      render :edit, alert: '更新できません'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name,  user_ids:
     [] )
  end
end
