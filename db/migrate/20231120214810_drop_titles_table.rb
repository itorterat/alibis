class DropTitlesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :titles
  end
end
