class GroupsController < ApplicationController
   before_action :set_group, only: [:update, :edit]
  def index
    @groups = current_user.groups
  end
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
    all_member = User.all
    @searched_group = all_member.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json {render json: @searched_group}
      format.html {}
    end
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: '更新できました'
    else
      render :edit, alert: '更新できません'
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name,  user_ids:
     [] )
  end
end
