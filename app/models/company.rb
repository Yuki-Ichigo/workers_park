class Company < ApplicationRecord
	has_many :company_members, dependent: :destroy
	has_many :works, dependent: :destroy

	validates :name, presence: true, length: {minimum: 2, maximum: 30}
	validates :name_kana, presence: true, length: {minimum: 2, maximum: 30}
	validates :establishment, length: {is: 6}
	validates :email, presence: true, length: {minimum: 5, maximum: 50}
	validates :zip_code, length: {is: 7}
	validates :address_prefecture_name, presence: true, length: {minimum: 1, maximum: 5}
	validates :address_city, length: {maximum: 15}
	validates :address_line1, length: {maximum: 20}
	validates :length, {maximum: 20}
	validates :phone_number, presence: true, length: {minimum: 3, maximum: 15}

	attachment :image, destroy: false
end
