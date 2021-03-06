class Company < ApplicationRecord
	has_many :company_members, dependent: :destroy
	has_many :users, through: :company_members
	accepts_nested_attributes_for :company_members

	has_many :works, dependent: :destroy
	has_many :work_users, through: :works
	accepts_nested_attributes_for :works

	has_many :talk_rooms, dependent: :destroy
	has_many :talk_room_users, through: :talk_rooms
	accepts_nested_attributes_for :talk_rooms

	validates :name, presence: true
	validates :name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
	validates :establishment, length: {is: 6}
	validates :email, presence: true, length: {minimum: 5, maximum: 50}
	validates :zip_code, length: {is: 7}, format: { with: /\A[0-9]+\z/, message: 'はハイフンなし、半角数字で入力して下さい。'}
	validates :address_prefecture, presence: true, length: {minimum: 1, maximum: 5}
	validates :address_city, length: {maximum: 15}
	validates :address_line1, length: {maximum: 30}
	validates :address_line2, length: {maximum: 50}
	validates :phone_number, presence: true, length: {minimum: 3, maximum: 15}, format: { with: /\A[0-9]+\z/, message: 'はハイフンなし、半角数字で入力して下さい。'}
    validates :introduction, length: {maximum: 1000}
    validates :future, length: {maximum: 1000}

	attachment :image, destroy: false
    attachment :i_image1, destroy: false
    attachment :i_image2, destroy: false
    attachment :f_image1, destroy: false
    attachment :f_image2, destroy: false
end
