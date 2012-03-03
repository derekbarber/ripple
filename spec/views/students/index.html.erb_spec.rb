require 'spec_helper'

describe "students/index" do
  before(:each) do
    assign(:students, [
      stub_model(Student,
        :first_name => "First Name",
        :family_name => "Family Name",
        :family_id => 1,
        :gender => "Gender",
        :custom_contact_details => false,
        :street_address => "Street Address",
        :city => "City",
        :postal_code => "Postal Code",
        :home_phone => "Home Phone",
        :mobile_phone => "Mobile Phone",
        :primary_email => "Primary Email",
        :secondary_email => "Secondary Email",
        :notes => "MyText",
        :status => 1
      ),
      stub_model(Student,
        :first_name => "First Name",
        :family_name => "Family Name",
        :family_id => 1,
        :gender => "Gender",
        :custom_contact_details => false,
        :street_address => "Street Address",
        :city => "City",
        :postal_code => "Postal Code",
        :home_phone => "Home Phone",
        :mobile_phone => "Mobile Phone",
        :primary_email => "Primary Email",
        :secondary_email => "Secondary Email",
        :notes => "MyText",
        :status => 1
      )
    ])
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Family Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Home Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mobile Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Primary Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Secondary Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
