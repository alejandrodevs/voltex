require 'rails_helper'

RSpec.describe Voltex do
  describe 'default setup' do
    it { expect(subject.default_actions).to eq %w(index show create update destroy) }
    it { expect(subject.user_class).to eq 'User' }
    it { expect(subject.role_class).to eq 'Role' }
    it { expect(subject.permission_class).to eq 'Permission' }
    it { expect(subject.permissions_role_class).to eq 'PermissionsRole' }
    it { expect(subject.exclude).to eq [] }
    it { expect(subject.include).to eq [] }
    it { expect(subject.user_model).to eq User }
    it { expect(subject.role_model).to eq Role }
    it { expect(subject.permission_model).to eq Permission }
    it { expect(subject.user_name).to eq 'user' }
    it { expect(subject.role_name).to eq 'role' }
    it { expect(subject.permission_name).to eq 'permission' }
    it { expect(subject.users_name).to eq 'users' }
    it { expect(subject.roles_name).to eq 'roles' }
    it { expect(subject.permissions_name).to eq 'permissions' }
  end
end
