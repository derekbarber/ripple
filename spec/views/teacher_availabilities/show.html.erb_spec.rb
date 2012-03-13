require 'spec_helper'

describe "teacher_availabilities/show" do
  before(:each) do
    @teacher_availability = assign(:teacher_availability, stub_model(TeacherAvailability,
      :teacher_id => "",
      :day_of_week => "Day Of Week",
      :custom_start_location => false,
      :start_address => "Start Address",
      :start_city => "Start City",
      :start_postal_code => "Start Postal Code",
      :custom_end_location => false,
      :end_address => "End Address",
      :end_city => "End City",
      :end_postal_code => "End Postal Code",
      :available_surrey => false,
      :available_whiterock => false,
      :available_langley => false,
      :available_aldergrove => false,
      :available_abbotsford => false,
      :available_newwest => false,
      :available => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Day Of Week/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Start Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Start City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Start Postal Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/End Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/End City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/End Postal Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
