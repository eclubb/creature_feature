require 'spec_helper'

describe Admin::FeaturesController do
  describe "GET index" do
    it "assigns all features as @features" do
      feature = Factory.create(:feature)
      get :index
      assigns(:features).should eq([feature])
    end
  end
end
