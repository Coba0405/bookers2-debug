class Comment < ApplicationRecord
  belongs_to :user #Comment.userでコメントの所有者を取得
  belongs_to :book #Comment.bookでそのコメントがされた投稿を
end
