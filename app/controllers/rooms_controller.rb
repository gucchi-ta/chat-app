class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)       #Railsでは、保存する前に必ずストロングパラメーターを使って許可を行わなければ、データの保存がされないように、セキュリティ対策が取られている、
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])     #配列に対して保存を許可したい場合は、キーの名称と関連づけてバリューに[]と記述。
  end
end
