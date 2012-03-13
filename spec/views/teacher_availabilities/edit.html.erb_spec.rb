require 'spec_helper'

describe "teacher_availabilities/edit" do
  before(:each) do
    @teacher_availability = assign(:teacher_availability, stub_model(TeacherAvailability,
      :teacher_id => "",
      :day_of_week => "MyString",
      :custom_start_location => false,
      :start_address => "MyString",
      :start_city => "MyString",
      :start_postal_code => "MyString",
      :custom_end_location => false,
      :end_address => "MyString",
      :end_city => "MyString",
      :end_postal_code => "MyString",
      :available_surrey => false,
      :available_whiterock => false,
      :available_langley => false,
      :available_aldergrove => false,
      :available_abbotsford => false,
      :available_newwest => false,
      :available => ""
    ))
  end

  it "renders the edit teacher_availability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teacher_availabilities_path(@teacher_availability), :method => "post" do
      assert_select "input#teacher_availability_teacher_id", :name => "teacher_availability[teacher_id]"
      assert_select "input#teacher_availability_day_of_week", :name => "teacher_availability[day_of_week]"
      assert_select "input#teacher_availability_custom_start_location", :name => "teacher_availability[custom_start_location]"
      assert_select "input#teacher_availability_start_address", :name => "teacher_availability[start_address]"
      assert_select "input#teacher_availability_start_city", :name => "teacher_availability[start_city]"
      assert_select "input#teacher_availability_start_postal_code", :name => "teacher_availability[start_postal_code]"
      assert_select "input#teacher_availability_custom_end_location", :name => "teacher_availability[custom_end_location]"
      assert_select "input#teacher_availability_end_address", :name => "teacher_availability[end_address]"
      assert_select "input#teacher_availability_end_city", :name => "teacher_availability[end_city]"
      assert_select "input#teacher_availability_end_postal_code", :name => "teacher_availability[end_postal_code]"
      assert_select "input#teacher_availability_available_surrey", :name => "teacher_availability[available_surrey]"
      assert_select "input#teacher_availability_available_whiterock", :name => "teacher_availability[available_whiterock]"
      assert_select "input#teacher_availability_available_langley", :name => "teacher_availability[available_langley]"
      assert_select "input#teacher_availability_available_aldergrove", :name => "teacher_availability[available_aldergrove]"
      assert_select "input#teacher_availability_available_abbotsford", :name => "teacher_availability[available_abbotsford]"
      assert_select "input#teacher_availability_available_newwest", :name => "teacher_availability[available_newwest]"
      assert_select "input#teacher_availability_available", :name => "teacher_availability[available]"
    end
  end
end
