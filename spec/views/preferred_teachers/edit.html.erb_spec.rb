require 'spec_helper'

describe "preferred_teachers/edit" do
  before(:each) do
    @preferred_teacher = assign(:preferred_teacher, stub_model(PreferredTeacher,
      :student_instrument_id => 1,
      :teacher_id => 1,
      :order_of_preference => 1
    ))
  end

  it "renders the edit preferred_teacher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => preferred_teachers_path(@preferred_teacher), :method => "post" do
      assert_select "input#preferred_teacher_student_instrument_id", :name => "preferred_teacher[student_instrument_id]"
      assert_select "input#preferred_teacher_teacher_id", :name => "preferred_teacher[teacher_id]"
      assert_select "input#preferred_teacher_order_of_preference", :name => "preferred_teacher[order_of_preference]"
    end
  end
end
