require 'spec_helper'

describe "instruments/index" do
  before(:each) do
    assign(:instruments, [
      stub_model(Instrument,
        :name => "Name"
      ),
      stub_model(Instrument,
        :name => "Name"
      )
    ])
  end

  it "renders a list of instruments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
