class AttendancesController < ApplicationController
  def show
    @date = parsed_date
    @attendance_type = params[:attendance_type] || default_attendance_type

    @attendance_date = AttendanceDate.find_or_create_by!(date: @date) do |ad|
      ad.attendance_type = @attendance_type
    end

    ensure_attendance_records!(@attendance_date)

    @members = Member.active.order(:last_name, :first_name).includes(:attendances)
  end

  private

  def parsed_date
    Date.parse(params[:date])
  rescue
    # Use current date if parsing fails or no date provided
    # Date.current is timezone-aware in Rails,
    # unlike Date.today which uses server local date
    Date.current
  end

  def default_attendance_type
    AttendanceDate::ATTENDANCE_TYPES.first
  end

  def ensure_attendance_records!(attendance_date)
    existing_member_ids = attendance_date.attendances.pluck(:member_id).to_set

    new_records = Member.active.where.not(id: existing_member_ids).map do |member|
      {
        member_id: member.id,
        attendance_date_id: attendance_date.id,
        status: "present",
        created_at: Time.current,
        updated_at: Time.current
      }
    end

    Attendance.insert_all!(new_records) if new_records.any?
  end
end
