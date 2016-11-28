class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.string :image
      t.text :skills,	        default: []
      t.text :categories,	        default: []
      t.string :max_age
      t.string :min_age
      t.string :address
      t.string :city
      t.timestamps null: false
    end
  end
end
