# frozen_string_literal: true
RSpec.describe '/users' do
  include Pragma::Devise::Engine.routes.url_helpers

  describe 'GET /current' do
    subject { -> { get user_path(id: 'current') } }

    let(:current_user) { create(:user) }
    before { authenticate_as current_user }

    it 'responds with 200 OK' do
      subject.call
      expect(last_response.status).to eq(200)
    end

    it 'responds with the user' do
      subject.call
      expect(parsed_response['email']).to eq(current_user.email)
    end
  end

  describe 'POST /' do
    subject { -> { post users_path, body.to_json } }

    context 'with valid data' do
      let(:user) { attributes_for(:user) }
      let(:body) { user }

      it 'responds with 201 Created' do
        subject.call
        expect(last_response.status).to eq(201)
      end
    end

    context 'with invalid data' do
      let(:body) do
        {}
      end

      it 'responds with 422 Unprocessable Entity' do
        subject.call
        expect(last_response.status).to eq(422)
      end
    end
  end
end
