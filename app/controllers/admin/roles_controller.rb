module Admin
  class RolesController < ApplicationController
    def index
      @roles = Role.visible
    end

    def show
      get_and_verify_role
    end

    def new
      @role = Role.new
      @features = Feature.all
    end

    def edit
      get_and_verify_role
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
          next if fp['feature_id'].blank?
          read_only = fp['read_only'] == fp['feature_id']
          @role.feature_permissions << FeaturePermission.new(fp.merge(:role => @role, :read_only => read_only))
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
      return unless get_and_verify_role

      if params[:role]
        fp_params = params[:role].delete(:feature_permissions) || []
      else
        fp_params = []
      end

      @features = Feature.all

      success = false

      if success = @role.update_attributes(params[:role])
        @role.features = []
        fp_params.each do |fp|
          next if fp['feature_id'].blank?
          read_only = fp['read_only'] == fp['feature_id']
          @role.feature_permissions << FeaturePermission.new(fp.merge(:role => @role, :read_only => read_only))
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
      return unless get_and_verify_role
      @role.destroy

      notice = 'Role was successfully deleted.'

      redirect_to(admin_roles_url, :notice => notice)
    end

    private

    def get_and_verify_role
      @role = Role.visible.find(params[:id]) rescue nil

      redirect_to(admin_roles_url, :alert => 'Invalid Role') and return false if @role.nil?

      return true
    end
  end
end
