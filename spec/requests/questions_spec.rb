require 'rails_helper'

RSpec.describe 'Question', type: :request do

  let!(:user) { FactoryGirl.create(:user)}
  let!(:questions) { FactoryGirl.create_list(:question, 10, user_id: user.id) }
  let(:user_id) { user.id }
  let(:question_id) { questions.first.id }

  describe 'GET questions' do
    before { get "/questions" }

    it 'returns questions' do
      expect(json).not_to be_empty
      number = Question.where(private: false).count
      expect(json.size).to eq(number)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET question/:id' do
    context 'when record does not exist' do
      let(:question_id) {Question.last.id + 23}

      it 'returns status code 404' do
        get "/questions/#{question_id}"
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        get "/questions/#{question_id}"
        expect(response.body).to match(/Couldn't find Question with 'id'/)
      end
    end
  end
end
