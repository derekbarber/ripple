require 'spec_helper'

describe "student_availabilities/edit" do
  before(:each) do
    @student_availability = assign(:student_availability, stub_model(StudentAvailability,
      :student_id => 1,
      :day_of_week => "MyString",
      :preferred_time => false,
      :order_of_preference => 1
    ))
  end

  it "renders the edit student_availability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => student_availabilities_path(@student_availability), :method => "post" do
      assert_select "input#student_availability_student_id", :name => "student_availability[student_id]"
      assert_select "input#student_availability_day_of_week", :name => "student_availability[day_of_week]"
      assert_select "input#student_availability_preferred_time", :name => "student_availability[preferred_time]"
      assert_select "input#student_availability_order_of_preference", :name => "student_availability[order_of_preference]"
    end
  end
end
