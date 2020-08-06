class AddDefaultFalseToAnswerCorrect < ActiveRecord::Migration[6.0]
  def up
    change_column :answers, :correct, false
  end

  def down
    change_column :answers, :correct, nil
  end
end
