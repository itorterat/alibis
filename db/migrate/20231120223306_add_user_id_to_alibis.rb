class AddUserIdToAlibis < ActiveRecord::Migration[7.0]
  def change
    add_reference :alibis, :user, foreign_key: true
  end
end
