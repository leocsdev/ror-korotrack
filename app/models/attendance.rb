# == Schema Information
#
# Table name: attendances
#
#  id                 :bigint           not null, primary key
#  status             :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  attendance_date_id :bigint           not null
#  member_id          :bigint           not null
#
# Indexes
#
#  index_attendances_on_attendance_date_id  (attendance_date_id)
#  index_attendances_on_member_and_date     (member_id,attendance_date_id) UNIQUE
#  index_attendances_on_member_id           (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendance_date_id => attendance_dates.id)
#  fk_rails_...  (member_id => members.id)
#
class Attendance < ApplicationRecord
  STATUSES = %w[present absent].freeze

  belongs_to :member
  belongs_to :attendance_date

  validates :status, presence: true, inclusion: { in: STATUSES }
end
