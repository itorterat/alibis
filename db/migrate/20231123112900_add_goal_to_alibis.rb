class AddGoalToAlibis < ActiveRecord::Migration[7.0]
  def change
    add_column :alibis, :goal, :integer, default: 0
    change_column_default :alibis, :status, :available
    change_column_default :bookings, :status, :pending
  end
end
