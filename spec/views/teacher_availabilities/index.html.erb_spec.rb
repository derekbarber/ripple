require 'spec_helper'

describe "teacher_availabilities/index" do
  before(:each) do
    assign(:teacher_availabilities, [
      stub_model(TeacherAvailability,
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
      ),
      stub_model(TeacherAvailability,
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
      )
    ])
  end

  it "renders a list of teacher_availabilities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Day Of Week".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Start Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Start City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Start Postal Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "End Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "End City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "End Postal Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
