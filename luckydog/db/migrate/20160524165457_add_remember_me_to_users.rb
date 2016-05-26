class AddRememberMeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rememeber_me, :string
  end
end
