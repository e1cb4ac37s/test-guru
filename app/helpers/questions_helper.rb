module QuestionsHelper
  def question_header(test)
    prefix = 'Create new ' if action_name == 'new'
    prefix = 'Edit' if action_name == 'edit'
    "#{prefix} \"#{test.title}\" question"
  end
end