require "spec_helper"

describe TeacherAvailabilitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/teacher_availabilities").should route_to("teacher_availabilities#index")
    end

    it "routes to #new" do
      get("/teacher_availabilities/new").should route_to("teacher_availabilities#new")
    end

    it "routes to #show" do
      get("/teacher_availabilities/1").should route_to("teacher_availabilities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teacher_availabilities/1/edit").should route_to("teacher_availabilities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teacher_availabilities").should route_to("teacher_availabilities#create")
    end

    it "routes to #update" do
      put("/teacher_availabilities/1").should route_to("teacher_availabilities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teacher_availabilities/1").should route_to("teacher_availabilities#destroy", :id => "1")
    end

  end
end
