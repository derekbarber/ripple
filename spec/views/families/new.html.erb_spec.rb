require 'spec_helper'

describe "families/new" do
  before(:each) do
    assign(:family, stub_model(Family,
      :family_name => "MyString",
      :parent_names => "MyString",
      :street_address => "MyString",
      :postal_code => "MyString",
      :city => "MyString",
      :primary_email => "MyString",
      :secondary_email => "MyString",
      :home_phone => "MyString",
      :mobile_phone => "MyString",
      :notes => "MyText",
      :status => 1
    ).as_new_record)
  end

  it "renders new family form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => families_path, :method => "post" do
      assert_select "input#family_family_name", :name => "family[family_name]"
      assert_select "input#family_parent_names", :name => "family[parent_names]"
      assert_select "input#family_street_address", :name => "family[street_address]"
      assert_select "input#family_postal_code", :name => "family[postal_code]"
      assert_select "input#family_city", :name => "family[city]"
      assert_select "input#family_primary_email", :name => "family[primary_email]"
      assert_select "input#family_secondary_email", :name => "family[secondary_email]"
      assert_select "input#family_home_phone", :name => "family[home_phone]"
      assert_select "input#family_mobile_phone", :name => "family[mobile_phone]"
      assert_select "textarea#family_notes", :name => "family[notes]"
      assert_select "input#family_status", :name => "family[status]"
    end
  end
end
