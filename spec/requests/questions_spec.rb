require 'rails_helper'

RSpec.describe 'Question', type: :request do

  let!(:questions) { FactoryGirl.create_list(:question, 10, user_id: user.id) }
  let!(:user) { FactoryGirl.create(:user)}
  let(:user_id) { user.id }
  let(:question_id) { questions.first.id }

  describe 'GET/users/:user_id/questions' do
    before { get "/users/#{user_id}/questions" }

    it 'returns questions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status 200' do
      expect(response).to have_https_status(200)
    end
  end

  context 'when record does not exit' do
    let(:question_id) {100}

    it 'returns status code 404' do
      expect(response).to have_http_status(404)
    end

    it 'returns a not found message' do
      expect(response.body).to match(/Question not found/)
    end
  end
end
