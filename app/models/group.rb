class Group < ApplicationRecord
  belong_to :user
  has_many :group_investments, dependent: :destroy
  has_many :investments, through: :group_investments
  
  validates :name, presence: true
  validates :icon, presence: true
end
