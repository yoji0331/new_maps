require 'test_helper'

class DatumTest < ActiveSupport::TestCase
  def setup
    @datum = Datum.new(date: "2016-01-01 13:22:13", latitude: "50", longitude: "100",
    value1: "0",value2: "0",value3: "0",value4: "0",value5: "0",value6: "0",
    value7: "0",value8: "0",value9: "0",value10: "0",value11: "0",value12: "0",
    value13: "0",value14: "0",value15: "0",value16: "0",value17: "0",value18: "0",
    value19: "0",value20: "0",value21: "0",value22: "0",value23: "0",value24: "0",
    value25: "0",temperature:"1.1",weather:"mozi")
  end

  test "should be valid" do
    assert @datum.valid?
  end
  
  test "latitude should be present" do
    @datum.latitude = "     "
    assert_not @datum.valid?
  end
  
  test "longitude should be present" do
    @datum.longitude = "     "
    assert_not @datum.valid?
  end
  
  test "latitude" do
    @datum.latitude = "-91"
    assert_not @datum.valid?
  end

  test "longitude" do
    @datum.longitude = "-181"
    assert_not @datum.valid?
  end
  
  test "value1" do
    @datum.value1 = "-1"
    assert_not @datum.valid?
  end
  
  test "weather" do
    @datum.weather = "a" * 257
    assert_not @datum.valid?
  end
  
  test "temperature" do
    @datum.temperature = 101
    assert_not @datum.valid?
  end
  
end
