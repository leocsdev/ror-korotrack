class CreateAttendances < ActiveRecord::Migration[8.1]
  def change
    create_table :attendances do |t|
      t.references :member, null: false, foreign_key: true
      t.references :attendance_date, null: false, foreign_key: true
      t.string :status, null: false

      t.timestamps
    end

    # Prevents duplicate attendance records
    # Enforces relational integrity
    # Makes race conditions harmless
    add_index :attendances, [ :member_id, :attendance_date_id ], unique: true, name: "index_attendances_on_member_and_date"
  end
end
