class AddUserIdToGroup < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :user, null: false
  end
end
