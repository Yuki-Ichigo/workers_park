class Company < ApplicationRecord
	has_many :users, through: :group_users
	has_many :company_members, dependent: :destroy
	accepts_nested_attributes_for :company_members

	has_many :users, through: :works
	has_many :works, dependent: :destroy
	accepts_nested_attributes_for :works

	has_one :information, dependent: :destroy

	validates :name, presence: true
	validates :name_kana, presence: true
	validates :establishment, length: {is: 6}
	validates :email, presence: true, length: {minimum: 5, maximum: 50}
	validates :zip_code, length: {is: 7}
	validates :address_prefecture, presence: true, length: {minimum: 1, maximum: 5}
	validates :address_city, length: {maximum: 15}
	validates :address_line1, length: {maximum: 20}
	validates :address_line1, length: {maximum: 20}
	validates :phone_number, presence: true, length: {minimum: 3, maximum: 15}

	attachment :image, destroy: false
end
