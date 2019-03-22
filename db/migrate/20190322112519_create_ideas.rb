class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.text :idea
      t.string :image
      t.references :user, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
