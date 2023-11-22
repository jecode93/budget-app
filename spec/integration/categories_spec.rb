require 'rails_helper'

RSpec.describe 'groups', type: :view, js: true do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Jean Emmanuel Cadet', email: 'jeanemmanuelcadet@gmail.com', password: 'anything')

      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      @group = Group.create(user: @user, name: 'Cookies', icon: 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
      visit groups_path
    end

    it 'renders group name' do
      expect(page).to have_content(@group.name)
    end

    it 'renders group icon' do
      find("img[src='#{@group.icon}']")
    end

    it 'renders group\'s total investments' do
      expect(page).to have_content(@group.investments.sum(:amount))
    end

    it 'redirects to specific group page' do
      find('#groupCard').click
      expect(page).to have_current_path(group_investments_path(@group))
    end

    it 'redirects to form to create new group' do
      click_link 'Add new category'
      expect(page).to have_current_path(new_group_path)
    end
  end
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Jean Emmanuel Cadet', email: 'jeanemmanuelcadet@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      @group = Group.create(user: @user, name: 'Cookies', icon: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=2598&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')

      @investment = Investment.create(author: @user, name: 'Buy cookies for mom', amount: 25, group_ids: [@group.id])
      visit group_investments_path(@group)
    end

    it 'renders total investments of group' do
      expect(page).to have_content(@group.investments.sum(:amount))
    end

    it 'renders investment name' do
      expect(page).to have_content(@investment.name)
    end

    it 'renders investment amount' do
      expect(page).to have_content(@investment.amount)
    end

    it 'redirects to form to create new investment' do
      click_link 'Add new transaction'
      expect(page).to have_current_path(new_group_investment_path(@group))
    end

    it 'redirects to groups page' do
      Capybara.page.find('.w-6').click
      expect(page).to have_current_path(groups_path)
    end
  end
end
