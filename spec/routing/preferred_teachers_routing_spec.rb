require "spec_helper"

describe PreferredTeachersController do
  describe "routing" do

    it "routes to #index" do
      get("/preferred_teachers").should route_to("preferred_teachers#index")
    end

    it "routes to #new" do
      get("/preferred_teachers/new").should route_to("preferred_teachers#new")
    end

    it "routes to #show" do
      get("/preferred_teachers/1").should route_to("preferred_teachers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/preferred_teachers/1/edit").should route_to("preferred_teachers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/preferred_teachers").should route_to("preferred_teachers#create")
    end

    it "routes to #update" do
      put("/preferred_teachers/1").should route_to("preferred_teachers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/preferred_teachers/1").should route_to("preferred_teachers#destroy", :id => "1")
    end

  end
end
