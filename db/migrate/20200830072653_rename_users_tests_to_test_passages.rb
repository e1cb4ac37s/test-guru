class RenameUsersTestsToTestPassages < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_tests, :test_passages
  end
end
