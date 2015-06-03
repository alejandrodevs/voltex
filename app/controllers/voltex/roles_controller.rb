require_dependency 'voltex/application_controller'

module Voltex
  class RolesController < ApplicationController
    before_action :set_resource
    helper_method :resource_name, :permission_resource_name

    # GET /voltex/roles/1/edit
    def edit
    end

    # PUT /voltex/roles/1
    def update
      if @resource.update(resource_params)
        redirect_to @resource, notice: t('.notice', default: update_message)
      else
        render :edit
      end
    end

    protected

    def resource_name
      Voltex.role_class.underscore.parameterize('_')
    end

    def permission_resource_name
      Voltex.permission_class.underscore.parameterize('_')
    end

    private

    def set_resource
      @resource = Voltex.role_class.constantize.find(params[:id])
    end

    def resource_params
      params.require(resource_name.to_sym).permit(*permitted_attributes)
    end

    def permitted_attributes
      [{:"#{permission_resource_name}_ids" => []}]
    end

    def update_message
      'Permissions were updated successfully.'
    end
  end
end
