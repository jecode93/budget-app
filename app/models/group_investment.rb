class GroupInvestment < ApplicationRecord
  belongs_to :group
  belongs_to :investment
end
