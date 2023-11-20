class RemoveReferencesFromAlibis < ActiveRecord::Migration[7.0]
  def change
    remove_column :alibis, :references
  end
end
