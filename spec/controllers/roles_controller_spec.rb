require 'rails_helper'

RSpec.describe Voltex::RolesController do
  routes { Voltex::Engine.routes }
  let!(:role)  { Role.create(name: 'Manager') }
  let!(:perm1) { Permission.create(resource: 'Post', action: :index) }
  let!(:perm2) { Permission.create(resource: 'Post', action: :show) }
  let!(:perm3) { Permission.create(resource: 'Post', action: :create) }
  let!(:perm4) { Permission.create(resource: 'Post', action: :update) }
  let!(:perm5) { Permission.create(resource: 'Post', action: :destroy) }

  describe 'GET edit' do
    it 'assigns resource' do
      get :edit, id: role.to_param
      expect(assigns(:resource)).to eq role
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      let(:permissions) { [1, 3, 5] }

      before do
        put :update, id: role.to_param, role: {
          permission_ids: permissions
        }
      end

      it 'updates resource permissions' do
        expect(role.reload.permission_ids).to eql permissions
      end

      it 'assigns resource' do
        expect(assigns(:resource)).to eq role
      end

      it 'sets flash message' do
        expect(flash[:notice]).to eql 'Permissions were updated successfully.'
      end

      it 'redirects to resource' do
        expect(response).to redirect_to role
      end
    end
  end
end
