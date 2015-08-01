class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.string :title
      t.text :text
      t.string :date
      t.integer :priority
      t.boolean :completed, default: false
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
