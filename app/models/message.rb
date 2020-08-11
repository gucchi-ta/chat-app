class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  #「has_one_attached」で、各レコードと画像ファイルを1対1の関係で紐づけることができる。

  validates :content, presence: true
end
