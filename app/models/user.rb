class User < ApplicationRecord
	has_many :groups, dependent: :destroy
	has_many :investments, foreign_key: 'author_id', dependent: :destroy
	
	validates :name, presence: true
end
