class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.text :content, null:false

      t.timestamps
    end
  end
end
