class Message < ApplicationRecord
	belongs_to :user
	belongs_to :destination, class_name: 'User'

	validates :user_id, presence: true
	validates :destination_id, presence: true
end
