class AddPresenceConstraintToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:users, :username, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :password, false)
  end
end
