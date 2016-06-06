class ChangeColumnRememberMeInUsersToRememberMe < ActiveRecord::Migration
  def change
  	rename_column :users, :rememeber_me, :remember_me
  end
end
