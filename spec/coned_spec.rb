require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Coned" do
  before do
    @coned = Coned.new().fetch()
  end
  
  it "should return a response" do
    @coned.should_not be_nil
  end

  it "should have data for each area and neighborhood" do
    areas = @coned.areas
    areas.each do |area|
      area.area_name.should be_an_instance_of String
      area.custs_out.should_not be_nil

      area.areas.each do |neighborhood|
        neighborhood.area_name.should be_an_instance_of String
        neighborhood.custs_out.should_not be_nil
      end
    end
  end
end
