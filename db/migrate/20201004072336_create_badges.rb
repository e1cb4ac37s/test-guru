class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.text :description, null: false
      t.integer :rule, null: false
      t.integer :rule_arg

      t.timestamps

    end

    add_index :badges, :name, unique: true
  end
end
