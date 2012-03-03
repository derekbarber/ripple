require 'spec_helper'

describe "students/edit" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :first_name => "MyString",
      :family_name => "MyString",
      :family_id => 1,
      :gender => "MyString",
      :custom_contact_details => false,
      :street_address => "MyString",
      :city => "MyString",
      :postal_code => "MyString",
      :home_phone => "MyString",
      :mobile_phone => "MyString",
      :primary_email => "MyString",
      :secondary_email => "MyString",
      :notes => "MyText",
      :status => 1
    ))
  end

  it "renders the edit student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path(@student), :method => "post" do
      assert_select "input#student_first_name", :name => "student[first_name]"
      assert_select "input#student_family_name", :name => "student[family_name]"
      assert_select "input#student_family_id", :name => "student[family_id]"
      assert_select "input#student_gender", :name => "student[gender]"
      assert_select "input#student_custom_contact_details", :name => "student[custom_contact_details]"
      assert_select "input#student_street_address", :name => "student[street_address]"
      assert_select "input#student_city", :name => "student[city]"
      assert_select "input#student_postal_code", :name => "student[postal_code]"
      assert_select "input#student_home_phone", :name => "student[home_phone]"
      assert_select "input#student_mobile_phone", :name => "student[mobile_phone]"
      assert_select "input#student_primary_email", :name => "student[primary_email]"
      assert_select "input#student_secondary_email", :name => "student[secondary_email]"
      assert_select "textarea#student_notes", :name => "student[notes]"
      assert_select "input#student_status", :name => "student[status]"
    end
  end
end
