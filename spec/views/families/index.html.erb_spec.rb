require 'spec_helper'

describe "families/index" do
  before(:each) do
    assign(:families, [
      stub_model(Family,
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
      ),
      stub_model(Family,
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
      )
    ])
  end

  it "renders a list of families" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Family Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Parent Names".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Primary Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Secondary Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Home Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mobile Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
