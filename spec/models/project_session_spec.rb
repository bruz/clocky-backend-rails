require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectSession do
  before(:each) do
    @valid_attributes = {
      :start_time => Time.now,
      :end_time => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    ProjectSession.create!(@valid_attributes)
  end
end
