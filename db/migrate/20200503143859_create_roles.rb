class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.boolean :create, default: false
      t.boolean :read, default: false
      t.boolean :update, default: false
      t.boolean :delete, default: false
      t.boolean :admin, default: false
      t.string :role_type, null: false
      t.timestamps
    end
  end
end
