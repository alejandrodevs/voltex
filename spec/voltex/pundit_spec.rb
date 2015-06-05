require 'rails_helper'
require 'voltex/pundit'

RSpec.describe Voltex::Pundit do
  let(:user) { User.create(name: 'User') }
  let(:role) { Role.create(name: 'Manager') }
  let(:perm) { Permission.create(resource: 'Role', action: :show) }

  class ApplicationPolicy
    include Voltex::Pundit
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end
  end

  before do
    role.permissions << perm
    user.role = role
    user.save
    Voltex.current_permissions = [perm]
  end

  subject { ApplicationPolicy.new(user, role) }

  describe '#permission?' do
    context 'when has the permission' do
      it 'returns true' do
        expect(subject.permission?(Role, :show)).to be true
      end
    end

    context 'when has not the permission' do
      it 'returns false' do
        expect(subject.permission?(Role, :destroy)).to be false
      end
    end
  end
end
