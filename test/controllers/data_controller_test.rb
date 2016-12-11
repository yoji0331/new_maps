require 'test_helper'

class DataControllerTest < ActionController::TestCase
  setup do
    @datum = data(:obuchi)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data)
  end

    test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datum" do
    assert_difference('Datum.count') do
      post :create, datum: {         
        survey_id: @datum.survey_id,
        site_name: @datum.site_name,
        reseacher_name: @datum.reseacher_name,
        date: @datum.date,
        weather: @datum.weather,
        temperature: @datum.temperature,
        latitude: @datum.latitude,
        longitude: @datum.longitude,
        value1: @datum.value1,
        value2: @datum.value2,
        value3: @datum.value3,
        value4: @datum.value4,
        value5: @datum.value5,
        value6: @datum.value6,
        value7: @datum.value7,
        value8: @datum.value8,
        value9: @datum.value9,
        value10: @datum.value10,
        value11: @datum.value11,
        value12: @datum.value12,
        value13: @datum.value13,
        value14: @datum.value14,
        value15: @datum.value15,
        value16: @datum.value16,
        value17: @datum.value17,
        value18: @datum.value18,
        value19: @datum.value19,
        value20: @datum.value10,
        value21: @datum.value21,
        value22: @datum.value22,
        value23: @datum.value23,
        value24: @datum.value24,
        value25: @datum.value25  }
    end

    assert_redirected_to datum_path(assigns(:datum))
  end

  test "should show datum" do
    get :show, id: @datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @datum
    assert_response :success
  end

  test "should update datum" do
    patch :update, id: @datum, datum: { 
    survey_id: @datum.survey_id,
        site_name: @datum.site_name,
        reseacher_name: @datum.reseacher_name,
        date: @datum.date,
        weather: @datum.weather,
        temperature: @datum.temperature,
        latitude: @datum.latitude,
        longitude: @datum.longitude,
        value1: @datum.value1,
        value2: @datum.value2,
        value3: @datum.value3,
        value4: @datum.value4,
        value5: @datum.value5,
        value6: @datum.value6,
        value7: @datum.value7,
        value8: @datum.value8,
        value9: @datum.value9,
        value10: @datum.value10,
        value11: @datum.value11,
        value12: @datum.value12,
        value13: @datum.value13,
        value14: @datum.value14,
        value15: @datum.value15,
        value16: @datum.value16,
        value17: @datum.value17,
        value18: @datum.value18,
        value19: @datum.value19,
        value20: @datum.value10,
        value21: @datum.value21,
        value22: @datum.value22,
        value23: @datum.value23,
        value24: @datum.value24,
        value25: @datum.value25
         }
    assert_redirected_to datum_path(assigns(:datum))
  end

  test "should destroy datum" do
    assert_difference('Datum.count', -1) do
      delete :destroy, id: @datum
    end
    assert_redirected_to data_path
  end
end
