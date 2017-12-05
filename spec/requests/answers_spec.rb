require 'rails_helper'

RSpec.describe 'Answer' do

  let!(:question) { FactoryGirl.create(:question, user_id: user.id) }
  let!(:user) {FactoryGirl.create(:user)}
  let!(:answers) { FactoryGirl.create_list(:answer, 20, question_id: question.id, user_id: user.id) }
  let(:question_id) {question.id}
  let(:user_id) {user.id}
  let(:id) {questions.first.id}

  describe 'GET/questions/:question_id/answers' do
    before { get "/questions/#{question_id}/answers" }

    context 'when question exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all answers' do
        expect(json).not_to be_empty
        expect(json.size).to eq(20)
      end
    end

    context 'when question does not exist' do
      let(:question_id) {Question.last.id + 23}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Question/)
      end
    end
  end
end

