# frozen_string_literal: true

require 'test_helper'

class TurnsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get turns_index_url
    assert_response :success
  end

  test 'should get show' do
    get turns_show_url
    assert_response :success
  end

  test 'should get new' do
    get turns_new_url
    assert_response :success
  end

  test 'should get edit' do
    get turns_edit_url
    assert_response :success
  end
end
