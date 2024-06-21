class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.boolean :answer, default: false

      t.timestamps
    end
  end
end
