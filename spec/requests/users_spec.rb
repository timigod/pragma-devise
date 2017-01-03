# frozen_string_literal: true
RSpec.describe '/users' do
  include Pragma::Devise::Engine.routes.url_helpers

  describe 'GET /' do
    subject { -> { get users_path } }

    let(:current_user) { create(:user) }
    before { authenticate_as current_user }

    it 'responds with 200 OK' do
      subject.call
      expect(last_response.status).to eq(200)
    end

    it 'responds with the users' do
      subject.call
      expect(parsed_response.first['email']).to eq(current_user.email)
    end
  end

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

    it "uses the application's decorator" do
      subject.call
      expect(parsed_response['full_name']).to eq('John Doe')
    end
  end

  describe 'GET /:id' do
    subject { -> { get user_path(id: user.id) } }

    let(:current_user) { create(:user) }
    before { authenticate_as current_user }

    context 'with the ID of the current user' do
      let(:user) { current_user }

      it 'responds with 200 OK' do
        subject.call
        expect(last_response.status).to eq(200)
      end
    end

    context 'with the ID of another user' do
      let(:user) { create(:user) }

      it 'responds with 403 Forbidden' do
        subject.call
        expect(last_response.status).to eq(403)
      end
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

  describe 'PATCH /current' do
    subject { -> { patch user_path(id: 'current'), body.to_json } }

    let(:current_user) { create(:user) }
    before { authenticate_as current_user }

    context 'with valid data' do
      let(:body) do
        {
          email: 'jdoe@example.com'
        }
      end

      it 'responds with 200 OK' do
        subject.call
        expect(last_response.status).to eq(200)
      end
    end

    context 'with invalid data' do
      let(:body) do
        {
          email: 'ciao'
        }
      end

      it 'responds with 422 Unprocessable Entity' do
        subject.call
        expect(last_response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /current' do
    subject { -> { delete user_path(id: 'current') } }

    let(:current_user) { create(:user) }
    before { authenticate_as current_user }

    it 'responds with 204 No Content' do
      subject.call
      expect(last_response.status).to eq(204)
    end
  end
end
