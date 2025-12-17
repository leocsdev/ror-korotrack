class Attendance < ApplicationRecord
  belongs_to :member
  belongs_to :attendance_date
end
