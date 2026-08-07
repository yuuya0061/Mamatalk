class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: { message: "を入力してください" }
end
