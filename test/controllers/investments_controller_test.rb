require 'test_helper'

class InvestmentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get investments_index_url
    assert_response :success
  end

  test 'should get show' do
    get investments_show_url
    assert_response :success
  end

  test 'should get new' do
    get investments_new_url
    assert_response :success
  end

  test 'should get edit' do
    get investments_edit_url
    assert_response :success
  end

  test 'should get destroy' do
    get investments_destroy_url
    assert_response :success
  end
end
