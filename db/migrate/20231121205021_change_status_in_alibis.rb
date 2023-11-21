class ChangeStatusInAlibis < ActiveRecord::Migration[7.0]
  def change
    change_column :alibis, :status, :integer, using: 'status::integer'
  end
end
