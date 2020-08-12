class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true,
    format: {with: /\A.+@.+\..+\z/i} # 大文字小文字区別しない、"~ @ ~ . ~"という形を許可
  validates :password,
    format: {with: /\A(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,32}\z/i} # アルファベットと数字を一つ以上含んだ8~32文字のパスワードを許可
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
