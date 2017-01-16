# frozen_string_literal: true
RSpec.describe '/protected-resource' do
  describe 'GET /' do
    subject { -> { get protected_resource_path } }

    context 'when unauthenticated' do
      it 'responds with 401 Unauthorized' do
        subject.call
        expect(last_response.status).to eq(401)
      end
    end

    context 'when authenticated' do
      let(:current_user) { create(:user) }
      before { authenticate_as current_user }

      it 'responds with 204 No Content' do
        subject.call
        expect(last_response.status).to eq(204)
      end
    end
  end
end
