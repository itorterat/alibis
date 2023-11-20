class RemoveUsersFromAlibis < ActiveRecord::Migration[7.0]
  def change
    remove_column :alibis, :users
  end
end
