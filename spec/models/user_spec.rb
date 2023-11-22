require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it 'has many groups' do
      user = User.reflect_on_association('groups')
      expect(user.macro).to eq(:has_many)
    end
  end

  context 'Validations' do
    it 'should have a name' do
      user = User.new(email: 'jeanemmanuelcadet@gmail.com', password: 'test123')
      expect(user.valid?).to eq false
    end

    it 'should have an email' do
      user = User.new(name: 'Jean Emmanuel Cadet', password: 'test123')
      expect(user.valid?).to eq false
    end

    it 'should have a password' do
      user = User.new(name: 'Jean Emmanuel Cadet', email: 'jeanemmanuelcadet@gmail.com')
      expect(user.valid?).to eq false
    end

    it 'should have a string name' do
      user = User.new(name: 'Jean Emmanuel Cadet', email: 'jeanemmanuelcadet@gmail.com', password: '123456')
      expect(user.valid?).to eq true
    end
  end
end
