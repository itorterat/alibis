class RemoveImageToAlibis < ActiveRecord::Migration[7.0]
  def change
    remove_column :alibis, :image, :string
  end
end
