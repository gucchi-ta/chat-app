class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
     # チャットルームに紐付いている全てのメッセージ : @room.messages
     #全てのメッセージ情報に紐づくユーザー情報を、includes(:user)と記述をすることにより、ユーザー情報を1度のアクセスでまとめて取得することができる。
  end

  def create   #メッセージフォームから投稿した際にこのアクションを実行
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

 



  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

end
