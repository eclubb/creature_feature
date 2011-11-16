require 'spec_helper'

describe Admin::RolesController do
  # This should return the minimal set of attributes required to create a valid
  # Role. As you add validations to Role, be sure to update the return value of
  # this method accordingly.
  def valid_attributes
    { :name => 'test' }
  end

  describe "GET index" do
    it "assigns all roles as @roles" do
      role = Factory.create(:role)
      get :index
      assigns(:roles).should eq([role])
    end
  end

  describe "GET show" do
    it "assigns the requested role as @role" do
      role = Factory.create(:role)
      get :show, :id => role.id.to_s
      assigns(:role).should eq(role)
    end
  end

  describe "GET new" do
    it "assigns a new role as @role and all features as @features" do
      features = FactoryGirl.create_list(:feature, 2)
      get :new
      assigns(:role).should be_a_new(Role)
      assigns(:features).should eq(features)
    end
  end

  describe "GET edit" do
    it "assigns the requested role as @role and all features as @features" do
      role = Factory.create(:role)
      features = FactoryGirl.create_list(:feature, 2)
      get :edit, :id => role.id.to_s
      assigns(:role).should eq(role)
      assigns(:features).should eq(features)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Role" do
        expect {
          post :create, :role => valid_attributes
        }.to change(Role, :count).by(1)
      end

      it "assigns a newly created role as @role" do
        post :create, :role => valid_attributes
        assigns(:role).should be_a(Role)
        assigns(:role).should be_persisted
      end

      it "redirects to the created role" do
        post :create, :role => valid_attributes
        response.should redirect_to(admin_role_url(Role.last))
      end

      it "sets a flash[:notice] message" do
        post :create, :role => valid_attributes
        flash[:notice].should eq('Role was successfully created.')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved role as @role and all features as @features" do
        # Trigger the behavior that occurs when invalid params are submitted
        Role.any_instance.stub(:save).and_return(false)
        features = FactoryGirl.create_list(:feature, 2)
        post :create, :role => {}
        assigns(:role).should be_a_new(Role)
        assigns(:features).should eq(features)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Role.any_instance.stub(:save).and_return(false)
        post :create, :role => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested role" do
        role = Factory.create(:role)
        # Assuming there are no other roles in the database, this
        # specifies that the Role created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Role.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => role.id, :role => {'these' => 'params'}
      end

      it "assigns the requested role as @role" do
        role = Factory.create(:role)
        put :update, :id => role.id, :role => valid_attributes
        assigns(:role).should eq(role)
      end

      it "redirects to the role" do
        role = Factory.create(:role)
        put :update, :id => role.id, :role => valid_attributes
        response.should redirect_to(admin_role_url(role))
      end

      it "sets a flash[:notice] message" do
        role = Factory.create(:role)
        put :update, :id => role.id, :role => valid_attributes
        flash[:notice].should eq('Role was successfully updated.')
      end
    end

    describe "with invalid params" do
      it "assigns the role as @role and all features as @features" do
        role = Factory.create(:role)
        features = FactoryGirl.create_list(:feature, 2)
        # Trigger the behavior that occurs when invalid params are submitted
        Role.any_instance.stub(:save).and_return(false)
        put :update, :id => role.id.to_s, :role => {}
        assigns(:role).should eq(role)
        assigns(:features).should eq(features)
      end

      it "re-renders the 'edit' template" do
        role = Factory.create(:role)
        # Trigger the behavior that occurs when invalid params are submitted
        Role.any_instance.stub(:save).and_return(false)
        put :update, :id => role.id.to_s, :role => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested role" do
      role = Factory.create(:role)
      expect {
        delete :destroy, :id => role.id.to_s
      }.to change(Role, :count).by(-1)
    end

    it "redirects to the roles list" do
      role = Factory.create(:role)
      delete :destroy, :id => role.id.to_s
      response.should redirect_to(admin_roles_url)
    end


    it "sets a flash[:notice] message" do
      role = Factory.create(:role)
      delete :destroy, :id => role.id.to_s
      flash[:notice].should eq('Role was successfully deleted.')
    end
  end
end
