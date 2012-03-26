require 'spec_helper'

describe "student_availabilities/index" do
  before(:each) do
    assign(:student_availabilities, [
      stub_model(StudentAvailability,
        :student_id => 1,
        :day_of_week => "Day Of Week",
        :preferred_time => false,
        :order_of_preference => 1
      ),
      stub_model(StudentAvailability,
        :student_id => 1,
        :day_of_week => "Day Of Week",
        :preferred_time => false,
        :order_of_preference => 1
      )
    ])
  end

  it "renders a list of student_availabilities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Day Of Week".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
