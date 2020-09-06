class NotNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :categories, :title, false
    change_column_null :questions, :body, false
    change_column_null :users, :email, false
  end
end
