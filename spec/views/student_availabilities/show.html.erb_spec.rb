require 'spec_helper'

describe "student_availabilities/show" do
  before(:each) do
    @student_availability = assign(:student_availability, stub_model(StudentAvailability,
      :student_id => 1,
      :day_of_week => "Day Of Week",
      :preferred_time => false,
      :order_of_preference => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Day Of Week/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
