class AddAuthorReferenceToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, index: true, null: false, foreign_key: { to_table: :users }
  end
end
