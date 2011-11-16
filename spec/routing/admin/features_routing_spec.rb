require 'spec_helper'

describe Admin::FeaturesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/features").should route_to("admin/features#index")
    end

  end
end
