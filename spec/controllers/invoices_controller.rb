require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }

  before do
    request.headers['Authorization'] = user.token
  end

  describe 'POST create' do
    let(:params) {
      {
        number: '1',
        date: '2022/01/10',
        company_info: 'This is a company informations',
        charge_info: 'This is a charge informations',
        price_cents: 12,
        emails: 'test@test.com, teste@test1.com.br'
      }
    }
    before do
      post :create, params: params
    end

    it { expect(response.status).to eq(200) }
  end

  describe 'GET index' do
    before do
      FactoryBot.create_list(:invoice, 3, user: user)
    end
    describe 'when success' do
      before do
        get :index
      end

      it { expect(response.status).to eq(200) }
      it { expect(JSON.parse(response.body)['invoices'].size).to eq(3) }
    end
  end

  describe 'GET show' do
    let!(:invoice) { FactoryBot.create(:invoice, user: user) }

    describe 'when success' do
      before do
        get :show, params: { id: invoice.id }
      end

      it { expect(response.status).to eq(200) }
    end

    describe 'when failure' do
      before do
        get :show, params: { id: 4 }
      end

      it { expect(response.status).to eq(400) }
    end
  end

  describe 'DELETE destroy' do
    let!(:invoice) { FactoryBot.create(:invoice, user: user) }

    describe 'when success' do
      before do
        delete :destroy, params: { id: invoice.id }
      end

      it { expect(response.status).to eq(204) }
    end

    describe 'when failure' do
      before do
        delete :destroy, params: { id: 4 }
      end

      it { expect(response.status).to eq(400) }
    end
  end
end
