class CreateAlibis < ActiveRecord::Migration[7.0]
  def change
    create_table :alibis do |t|
      t.string :title
      t.string :content
      t.string :status
      t.string :image
      t.string :category
      t.datetime :date
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
