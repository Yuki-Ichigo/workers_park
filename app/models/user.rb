class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  has_many :company_members, dependent: :destroy
  has_many :comment, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  validates :name_kana, presence: true, length: {minimum: 2, maximum: 30}
  validates :nic_name, presence: true, length: {minimum: 2, maximum: 10}
  validates :birthday, length: {is: 8}
  validates :email, presence: true, length: {minimum: 5, maximum: 50}
  validates :zip_code, length: {is: 7}
  validates :address_prefecture_name, length: {minimum: 1, maximum: 5}
  validates :address_city, length: {maximum: 15}
  validates :address_line1, length: {maximum: 20}
  validates :address_line2, length: {maximum: 20}
  validates :phone_number, length: {minimum: 3, maximum: 15}

  enum sex: {男性: 0, 女性: 1}
  enum permissions: {一般: 0, 企業担当者: 1, 管理者: 2}

  attachment :image, destroy: false
end
