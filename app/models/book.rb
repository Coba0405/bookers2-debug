class Book < ApplicationRecord
  def favorite?(user)
    favorites.where(user_id: user.id).exists?
  end
   belongs_to :user
   has_many :favorites, dependent: :destroy, foreign_key: :book_id
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
