class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title,     null: false
      t.boolean :private,  default: false
      t.integer :user_id, null: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
