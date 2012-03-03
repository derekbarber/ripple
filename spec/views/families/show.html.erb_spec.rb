require 'spec_helper'

describe "families/show" do
  before(:each) do
    @family = assign(:family, stub_model(Family,
      :family_name => "Family Name",
      :parent_names => "Parent Names",
      :street_address => "Street Address",
      :postal_code => "Postal Code",
      :city => "City",
      :primary_email => "Primary Email",
      :secondary_email => "Secondary Email",
      :home_phone => "Home Phone",
      :mobile_phone => "Mobile Phone",
      :notes => "MyText",
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Family Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Parent Names/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Postal Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Primary Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Secondary Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Home Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mobile Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
