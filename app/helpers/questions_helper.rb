module QuestionsHelper
  def question_header(test, question)
    t('.header', test_title: test.title)
    # "#{question.persisted? ? 'Edit' : 'Create new'} \"#{test.title}\" question"
  end
end