require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Coned" do
  it "should return a response" do
    @response = Coned.new().fetch()
    @response.should_not be_nil
  end
end
