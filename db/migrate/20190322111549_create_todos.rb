class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.text :todo, null: false
      t.datetime :deadline, null: false
      t.boolean :finished, null: false, default: false
      t.references :user, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
