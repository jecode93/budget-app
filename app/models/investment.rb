class Investment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :group_investments
  has_many :groups, through: :group_investments
  accepts_nested_attributes_for :group_investments, allow_destroy: true

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :group_ids, presence: true
end
