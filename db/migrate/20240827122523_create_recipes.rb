class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      
      t.string :title
      t.text :body
      t.text :recipe
      t.integer :category1
      t.integer :category2

      t.timestamps
    end
  end
end
