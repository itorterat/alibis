class CreateAlibis < ActiveRecord::Migration[7.0]
  def change
    create_table :alibis do |t|
      t.string :title
      t.string :content
      t.string :status
      t.string :image
      t.string :category
      t.string :users
      t.string :references

      t.timestamps
    end
  end
end
