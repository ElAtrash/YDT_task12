class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.boolean :can_create, default: false
      t.boolean :can_read, default: false
      t.boolean :can_update, default: false
      t.boolean :can_delete, default: false
      t.boolean :admin, default: false
      t.string :role_type, null: false
      t.timestamps
    end
  end
end
