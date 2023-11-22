require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:example) do
    @user = User.create(name: 'Jean Emmanuel Cadet', email: 'jeanemmanuelcadet@gmail.com', password: 'test123')
  end

  context 'Associations' do
    it 'belongs to an author' do
      group = Group.reflect_on_association('user')
      expect(group.macro).to eq(:belongs_to)
    end

    it 'has many investment' do
      group = Group.reflect_on_association('investments')
      expect(group.macro).to eq(:has_many)
    end
  end

  context 'Validations' do
    it 'checks for name' do
      group = Group.new(user: @user, icon: 'https://images.unsplash.com/photo-1595776613215-fe04b78de7d0?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
      expect(group.valid?).to eq false
    end

    it 'checks icon' do
      group = Group.new(user: @user, name: 'Computer')
      expect(group.valid?).to eq false
    end

    it 'checks name and icon' do
      group = Group.new(user: @user, name: 'Computer', icon: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=2598&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
      expect(group.valid?).to eq true
    end
  end
end
