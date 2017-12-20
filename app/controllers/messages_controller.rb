class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @message = Message.new

  end

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: ""
    else
      redirect_to group_messages_path, alert: "メッセージを保存できませんでした"
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end
end
