require 'rails_helper'
require 'voltex/cancan/ability'
require 'cancan'

RSpec.describe Voltex::CanCan::Ability do
  let(:user) { User.create(name: 'User') }
  let(:role) { Role.create(name: 'Manager') }
  let(:perm) { Permission.create(resource: 'Role', action: :show) }

  class Ability
    include CanCan::Ability
    include Voltex::CanCan::Ability

    def initialize(user)
      define_voltex_abilities(user)
    end
  end

  before do
    role.permissions << perm
    user.role = role
    user.save
  end

  subject { Ability.new(user) }

  describe '#define_voltex_abilities' do
    it { expect(subject.can?(:show, Role)).to be true }
    it { expect(subject.can?(:update, Role)).to be false }
  end
end
