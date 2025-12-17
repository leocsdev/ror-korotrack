class CreateAttendanceDates < ActiveRecord::Migration[8.1]
  def change
    create_table :attendance_dates do |t|
      t.date :date, null: false
      t.string :attendance_type, null: false, default: "ensayo"

      t.timestamps
    end

    add_index :attendance_dates, :date, unique: true
    add_index :attendance_dates, :attendance_type
  end
end
