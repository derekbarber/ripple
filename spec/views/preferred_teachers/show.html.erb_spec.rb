require 'spec_helper'

describe "preferred_teachers/show" do
  before(:each) do
    @preferred_teacher = assign(:preferred_teacher, stub_model(PreferredTeacher,
      :student_instrument_id => 1,
      :teacher_id => 1,
      :order_of_preference => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
