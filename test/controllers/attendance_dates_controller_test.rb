require "test_helper"

class AttendanceDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendance_dates_url
    assert_response :success
  end

  test "should get create" do
    post attendance_dates_url, params: { date: "2025-12-17", attendance_type: "ensayo" }
    assert_response :redirect
  end
end
