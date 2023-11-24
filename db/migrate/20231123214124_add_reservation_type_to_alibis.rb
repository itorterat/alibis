class AddReservationTypeToAlibis < ActiveRecord::Migration[7.0]
  def change
    add_column :alibis, :reservation_type, :integer, default: 0
  end
end
