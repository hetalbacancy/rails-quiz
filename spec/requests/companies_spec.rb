require 'rails_helper'

RSpec.describe 'Companies', type: :request do
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
    let(:company) { Company.create(name: 'comapny1') }

    it "renders a successful response" do
      get companies_path
      is_expected.to have_http_status(:ok)
    end
  end

  describe 'GET new' do
    it "renders a successful response" do
      get new_company_path
      is_expected.to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    it 'Creates a record' do
      valid_attributes = { name: 'foo' }
      expect {
        post companies_path(params: { company: valid_attributes })
      }.to change(Company, :count).by(1)
    end

    it 'With invalid params' do
      invalid_attributes = { name: '' }
      expect {
        post companies_path(params: { company: invalid_attributes })
      }.to change(Company, :count).by(0)
    end
  end

  describe 'GET edit' do
    let(:company) { Company.create(name: 'comapny1') }
    before { get edit_company_url(company) }
    it { is_expected.to be_successful }
  end

  # describe 'PATCH update' do
  #   let(:company) { Company.create(name: 'comapny1') }
  #   context "with valid parameters" do
  #     it 'Updates a record' do
  #       valid_attributes = { name: 'company2'}
  #       patch companies_path(company), params: { company: valid_attributes }
  #       company.reload
  #       expect(company.name).to eq("company2")
  #     end
  #   end
  # end

end
