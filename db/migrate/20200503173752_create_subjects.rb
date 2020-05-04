class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :topic
      t.text :description
      t.string :status, null: false

      t.timestamps
    end
  end
end
