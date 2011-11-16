module Admin
  class RolesController < ApplicationController
    def index
      @roles = Role.all
    end

    def show
      @role = Role.find(params[:id])
    end

    def new
      @role = Role.new
      @features = Feature.all
    end

    def edit
      @role = Role.find(params[:id])
      @features = Feature.all
    end

    def create
      if params[:role]
        fp_params = params[:role].delete(:feature_permissions) || []
      else
        fp_params = []
      end

      @role = Role.new(params[:role])
      @features = Feature.all

      success = false

      if success = @role.save
        fp_params.each do |fp|
          next if fp['feature_id'] == ''
          @role.feature_permissions << FeaturePermission.new(fp.merge(:role => @role))
        end

        success = @role.save
      end

      if success
        redirect_to(admin_role_url(@role), :notice => 'Role was successfully created.')
      else
        @role.destroy
        render :action => 'new'
      end
    end

    def update
      if params[:role]
        fp_params = params[:role].delete(:feature_permissions) || []
      else
        fp_params = []
      end

      @role = Role.find(params[:id])
      @features = Feature.all

      success = false

      if success = @role.update_attributes(params[:role])
        @role.features = []
        fp_params.each do |fp|
          next if fp['feature_id'] == ''
          @role.feature_permissions << FeaturePermission.new(fp.merge(:role => @role))
        end

        success = @role.save
      end

      if success
        redirect_to(admin_role_url(@role), :notice => 'Role was successfully updated.')
      else
        render :action => 'edit'
      end
    end

    def destroy
      @role = Role.find(params[:id])
      @role.destroy

      notice = 'Role was successfully deleted.'

      redirect_to(admin_roles_url, :notice => notice)
    end
  end
end
