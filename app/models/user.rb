class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates_format_of :encrypted_password, with: /\A[a-zA-Z0-9]+\z/
  validates_format_of :last_name, :first_name, with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/u
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ァ-ヶー]+\z/
end
