class Answer < ApplicationRecord
  QUESTION_BOUNDARY = 4

  belongs_to :question
  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate  :validate_within_question_boundary, on: :create

  def validate_within_question_boundary
    if question.answers.size >= 4
      errors[:base] << 'Question can not contain more than four answers.'
    end
  end
end
