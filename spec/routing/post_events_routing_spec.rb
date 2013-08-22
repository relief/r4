require "spec_helper"

describe PostEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/post_events").should route_to("post_events#index")
    end

    it "routes to #new" do
      get("/post_events/new").should route_to("post_events#new")
    end

    it "routes to #show" do
      get("/post_events/1").should route_to("post_events#show", :id => "1")
    end

    it "routes to #edit" do
      get("/post_events/1/edit").should route_to("post_events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/post_events").should route_to("post_events#create")
    end

    it "routes to #update" do
      put("/post_events/1").should route_to("post_events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/post_events/1").should route_to("post_events#destroy", :id => "1")
    end

  end
end
