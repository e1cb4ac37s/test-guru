module QuestionsHelper
  def question_header(test)
    t('.header', test_title: test.title)
  end
end