require 'rails_helper'

RSpec.describe 'Listing people', type: :feature do
  before(:each) do
    @user = User.create(
      email: 'user@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
    login_as(@user, scope: :user)
  
    Person.create(
      name: 'Foo Bar',
      phone_number: 'Biz',
      email: 'Baz'
    )
  end

  scenario 'with valid users' do
    visit people_path

    aggregate_failures do
      expect(page).to have_content('Foo Bar')
      expect(page).to have_content('Baz')
    end
  end

  scenario 'New person', type: :feature do
    visit new_person_path

    expect(page).to have_field :person_name
  end

end
