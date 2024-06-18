require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  before(:each) do
    @user = User.create(
      email: 'user@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
    sign_in @user
  end

  subject { response }
  describe 'GET index' do
    before { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe 'GET new' do
    before { get :new }

    it { is_expected.to have_http_status(:ok) }
  end

  describe 'POST create' do
    context 'with invalid params' do
      it 'Creates a record' do
        expect{ post :create, params: { person: { name: 'foo', phone_number: '123', email: 'foo' } } }.to change{ Person.count }.by(1)
      end

      it 'has status found' do
        expect(post :create, params: { person: { name: 'foo', phone_number: '123', email: 'foo' } }).to have_http_status(:found)
      end
    end

    context 'with invalid params' do
      it 'Creates a record' do
        expect{ post :create, params: { person: { name: 'foo', phone_number: '123' } } }.to change{ Person.count }.by(0)
      end
    end
  end
end
