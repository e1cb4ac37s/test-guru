class AddDefaultFalseToAnswerCorrect < ActiveRecord::Migration[6.0]
  def up
    change_column :answers, :correct, :boolean, default: false
  end

  def down
    change_column :answers, :correct, :boolean, default: nil
  end
end
