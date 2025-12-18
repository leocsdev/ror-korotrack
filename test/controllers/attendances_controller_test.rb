require "test_helper"

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get attendance_url
    assert_response :success
  end
end
