module QuestionsHelper
  def question_header(test, question)
    "#{question.persisted? ? 'Edit' : 'Create new'} \"#{test.title}\" question"
  end
end