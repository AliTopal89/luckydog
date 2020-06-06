class AddRememberMeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rememeber_me, :string
  end
end
