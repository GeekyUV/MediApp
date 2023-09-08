require "test_helper"

class Doctors::PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get registration_graph" do
    get doctors_patients_registration_graph_url
    assert_response :success
  end
end
