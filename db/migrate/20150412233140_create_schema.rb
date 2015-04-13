class CreateSchema < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :difficulty_id
      t.integer :score

      t.timestamps
    end

    create_table :difficulties do |t|
      t.string :name
    end
  end
end
