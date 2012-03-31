require 'spec_helper'

describe ScheduleStudentController do

  describe "GET 'pending'" do
    it "returns http success" do
      get 'pending'
      response.should be_success
    end
  end

end
