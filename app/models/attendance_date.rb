# == Schema Information
#
# Table name: attendance_dates
#
#  id              :bigint           not null, primary key
#  attendance_type :string           default("ensayo"), not null
#  date            :date             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_attendance_dates_on_attendance_type  (attendance_type)
#  index_attendance_dates_on_date             (date) UNIQUE
#
class AttendanceDate < ApplicationRecord
  ATTENDANCE_TYPES = %w[ensayo extra_ensayo pagsamba].freeze

  has_many :attendances, dependent: :destroy

  validates :date, presence: true, uniqueness: true
  validates :attendance_type, inclusion: { in: ATTENDANCE_TYPES }
end
