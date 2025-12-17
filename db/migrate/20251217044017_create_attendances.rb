class CreateAttendances < ActiveRecord::Migration[8.1]
  def change
    create_table :attendances do |t|
      t.references :member, null: false, foreign_key: true
      t.references :attendance_date, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
