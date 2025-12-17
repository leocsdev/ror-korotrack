class CreateMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :voice_part
      t.string :kapisanan
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :members, :active
  end
end
