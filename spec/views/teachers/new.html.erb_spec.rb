require 'spec_helper'

describe "teachers/new" do
  before(:each) do
    assign(:teacher, stub_model(Teacher,
      :first_name => "MyString",
      :family_name => "MyString",
      :gender => "MyString",
      :email => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :postal_code => "MyString",
      :home_phone => "MyString",
      :mobile_phone => "MyString",
      :secondary_email => "MyString",
      :notes => "MyText",
      :status => 1
    ).as_new_record)
  end

  it "renders new teacher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teachers_path, :method => "post" do
      assert_select "input#teacher_first_name", :name => "teacher[first_name]"
      assert_select "input#teacher_family_name", :name => "teacher[family_name]"
      assert_select "input#teacher_gender", :name => "teacher[gender]"
      assert_select "input#teacher_email", :name => "teacher[email]"
      assert_select "input#teacher_street_address", :name => "teacher[street_address]"
      assert_select "input#teacher_city", :name => "teacher[city]"
      assert_select "input#teacher_postal_code", :name => "teacher[postal_code]"
      assert_select "input#teacher_home_phone", :name => "teacher[home_phone]"
      assert_select "input#teacher_mobile_phone", :name => "teacher[mobile_phone]"
      assert_select "input#teacher_secondary_email", :name => "teacher[secondary_email]"
      assert_select "textarea#teacher_notes", :name => "teacher[notes]"
      assert_select "input#teacher_status", :name => "teacher[status]"
    end
  end
end
