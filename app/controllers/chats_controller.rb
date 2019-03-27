class ChatsController < ApplicationController
  before_action :set_group

  def index
    @chat = Chat.new
    @chats = @group.chats.includes(:user)
  end

  def create
    @chat = @group.chats.new(chat_params)
    if @chat.save
      redirect_to group_chats_path(@group), success:"メッセージを送信しました！"
    else
      @chats = @group.chats.includes(:user)
      flash.now[:danger] = "メッセージを入力してください"
      render :index
    end
  end

  def update
    @chat = @group.chats.find(params[:id])
    if @chat.update(removed: !@chat.removed)
      redirect_to group_chats_path(@group), warning:"メッセージを削除しました"
    else
      redirect_to group_chats_path(@group), danger:"メッセージ削除失敗しました"
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:chat, :image).merge(user_id: current_user.id)
  end
  # def chat_remove
  #   params.require(:chat).permit({chat:"このメッセージは削除されました"}, :image).merge(user_id: current_user.id)
  # end
  def set_group
    @group = Group.find(params[:group_id])
  end
end
