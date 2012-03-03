require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Family Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gender/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Postal Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Home Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mobile Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Primary Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Secondary Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
