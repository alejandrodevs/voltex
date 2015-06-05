require_dependency 'voltex/application_controller'

module Voltex
  class RolesController < ApplicationController
    before_action :set_resource

    # GET /voltex/roles/1/edit
    def edit
    end

    # PUT /voltex/roles/1
    def update
      if @resource.update(resource_params)
        redirect_to [main_app, @resource], notice: t('.notice', default: update_message)
      else
        render :edit
      end
    end

    private

    def set_resource
      @resource = Voltex.role_model.find(params[:id])
    end

    def resource_params
      params.require(Voltex.role_name).permit(*permitted_attributes)
    end

    def permitted_attributes
      [{:"#{Voltex.permission_name}_ids" => []}]
    end

    def update_message
      'Permissions were updated successfully.'
    end
  end
end
