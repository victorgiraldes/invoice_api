require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST create' do
    before do
      ENV['BASE_URL'] = 'test.environment.com'
    end

    describe 'when success' do
      before do
        post :create, params: { email: 'test@test.com' }
      end

      it { expect(response.status).to eq(200) }
    end

    describe 'when fail' do
      before do
        post :create
      end

      it { expect(response.status).to eq(400) }
    end
  end

  describe 'POST verify_token' do
    let(:user) { FactoryBot.create(:user, :token_status_pending) }

    describe 'when success' do
      before do
        post :verify_token, params: { token: user.token }
      end

      it { expect(response.status).to eq(200) }
      it { expect(user.reload.verified?).to be_truthy }
    end

    describe 'when failure' do
      before do
        post :verify_token, params: { token: '' }
      end

      it { expect(response.status).to eq(400) }
      it { expect(user.reload.verified?).to be_falsey }
    end
  end
end
