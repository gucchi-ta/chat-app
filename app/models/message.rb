class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  #「has_one_attached」で、各レコードと画像ファイルを1対1の関係で紐づけることができる。

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?    # テキストが存在していなくても画像の投稿を可能にする。
  end
end
