class MessagesController < ApplicationController
  before_action :set_group
  def index
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    @groups = current_user.groups
    if @message.save
      respond_to |format|
        format.html{redirect_to group_messages_path(@message.group_id), notice: "メッセージを送信できました"}
        format.json{render json: { name: @message.user.name,created_at: @message.created_at,body }}
      end
    else
      render :index, alert: "メッセージを入力してください。"
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end
    def set_group
      @group = Group.find(params[:group_id])
    end
end
