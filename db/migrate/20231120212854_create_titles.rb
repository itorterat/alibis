class CreateTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :titles do |t|
      t.string :content
      t.string :status
      t.string :image
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
