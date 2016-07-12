require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get students_show_url
    assert_response :success
  end

end
