class CreateMyArticles < ActiveRecord::Migration
  def change
    create_table :my_articles do |t|
      t.string :title
      t.text :body
      t.timestamps null: false
    end
  end
end
