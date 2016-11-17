class CreateEarlyRegistrants < ActiveRecord::Migration
  def change
    create_table :early_registrants do |t|
      t.string :full_name, null: false, default: ""
      t.string :email, null: false, default: ""

      t.timestamps
    end
    add_index :early_registrants, :email
  end
end
