require 'test_helper'

class CampoExtraNavigationTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "new campo extra not logged" do
    get "/campo_extras#new"
    assert_not flash.empty?
  end
end
