require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :start_date => Date.today,
      :project_status => "value for status"
    }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@valid_attributes)
  end
end
