require "test_helper"

class AttendanceDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendance_dates_index_url
    assert_response :success
  end

  test "should get create" do
    get attendance_dates_create_url
    assert_response :success
  end
end
