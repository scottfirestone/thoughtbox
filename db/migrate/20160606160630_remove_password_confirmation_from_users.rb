class RemovePasswordConfirmationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_confirmation
  end
end
