class CreateAttendanceDates < ActiveRecord::Migration[8.1]
  def change
    create_table :attendance_dates do |t|
      t.date :date
      t.string :attendance_type

      t.timestamps
    end
  end
end
