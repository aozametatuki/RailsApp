class Question < ApplicationRecord
  # アソシエーションの設定
  has_many :answer
  # バリデーションの設定
  validates :content, :name, presence: {message:'は、必須項目です。'}
end
