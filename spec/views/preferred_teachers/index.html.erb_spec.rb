require 'spec_helper'

describe "preferred_teachers/index" do
  before(:each) do
    assign(:preferred_teachers, [
      stub_model(PreferredTeacher,
        :student_instrument_id => 1,
        :teacher_id => 1,
        :order_of_preference => 1
      ),
      stub_model(PreferredTeacher,
        :student_instrument_id => 1,
        :teacher_id => 1,
        :order_of_preference => 1
      )
    ])
  end

  it "renders a list of preferred_teachers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
