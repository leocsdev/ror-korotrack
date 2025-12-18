class AttendanceDatesController < ApplicationController
  def index
    @attendance_dates = AttendanceDate.order(date: :desc)
  end

  def create
    attendance_date = AttendanceDate.find_or_create_by!(
      date: parsed_date,
      attendance_type: params[:attendance_type]
    )

    redirect_to attendance_path(date: attendance_date.date)
  end

  private

  def parsed_date
    Date.parse(params[:date])
  rescue ArgumentError
    Date.current
  end
end
