require 'spec_helper'

describe "TeacherAvailabilities" do
  describe "GET /teacher_availabilities" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get teacher_availabilities_path
      response.status.should be(200)
    end
  end
end
