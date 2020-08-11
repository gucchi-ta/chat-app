class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room
  #中間テーブルにuser_id,room_idに空で登録出来ないようにするバリデーションは付けなくていい
end
