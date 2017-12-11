json.questions @questions do |question|
  json.title question.title
  json.private question.private
  json.user_id question.user_id

  json.answers question.answers do |answer|
    json.body answer.body
    json.question_id answer.question_id
    json.user_id answer.user_id
  end
end
