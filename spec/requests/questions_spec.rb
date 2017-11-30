require 'rails_helper'

RSpec.describe 'Question', type: :request do

  let!(:questions) { create_list(:question, 10) }
  let(:question_id) { questions.first.id }

  describe 'GET/questions' do
    before { get '/questions' }

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
