require 'rails_helper'

RSpec.describe Investment, type: :model do
  before(:example) do
    @user = User.create(name: 'Jean Emmanuel Cadet', email: 'jeanemmanuelcadet@gmail.com', password: 'test123')
    @group = Group.new(user: @user, name: 'Computer', icon: 'https://images.unsplash.com/photo-1595776613215-fe04b78de7d0?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
  end

  context 'Associations' do
    it 'belongs to an author_id' do
      investment = Investment.reflect_on_association('author')
      expect(investment.macro).to eq(:belongs_to)
    end

    it 'has many categories' do
      investment = Investment.reflect_on_association('groups')
      expect(investment.macro).to eq(:has_many)
    end
  end

  context 'Validations' do
    it 'name should be presence' do
      investment = Investment.new(author_id: @user, amount: 200, group_ids: [@group.id])
      expect(investment.valid?).to eq false
    end

    it 'amount should be presence' do
      investment = Investment.new(author_id: @user, name: 'Converse', group_ids: [@group.id])
      expect(investment.valid?).to eq false
    end
  end
end
