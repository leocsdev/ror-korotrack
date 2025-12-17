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
require "test_helper"

class AttendanceDateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
