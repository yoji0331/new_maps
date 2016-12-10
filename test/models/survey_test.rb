require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  def setup
    @survey = Survey.new(name: "Example User")
  end

  test "should be valid" do
    assert @survey.valid?
  end
  
  test "name should be present" do
    @survey.name = " "
    assert_not @survey.valid?
  end
  
  test "namemozi" do
    @survey.name = "a" * 257
    assert_not @survey.valid?
  end
end
