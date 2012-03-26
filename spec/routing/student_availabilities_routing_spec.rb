require "spec_helper"

describe StudentAvailabilitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/student_availabilities").should route_to("student_availabilities#index")
    end

    it "routes to #new" do
      get("/student_availabilities/new").should route_to("student_availabilities#new")
    end

    it "routes to #show" do
      get("/student_availabilities/1").should route_to("student_availabilities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/student_availabilities/1/edit").should route_to("student_availabilities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/student_availabilities").should route_to("student_availabilities#create")
    end

    it "routes to #update" do
      put("/student_availabilities/1").should route_to("student_availabilities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/student_availabilities/1").should route_to("student_availabilities#destroy", :id => "1")
    end

  end
end
