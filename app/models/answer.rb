class Answer < ApplicationRecord
  # アソシエーションの設定
  belongs_to :question
  # バリデーションの設定
  validates :content, :name, presence: {message:'は、必須項目です。'}
end
