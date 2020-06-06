class ChangeColumnRememberMeInUsersToRememberMe < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :rememeber_me, :remember_me
  end
end
