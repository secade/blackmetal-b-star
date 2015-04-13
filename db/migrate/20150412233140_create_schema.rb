class CreateSchema < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :difficulty_id
      t.integer :score

      t.timestamps
    end

    create_table :difficulties do |t|
      t.string :name
      t.float :max
      t.float :gen
      t.float :speed
      t.float :fire_rate
      t.float :fire_speed
      t.float :enviro
    end
  end
end
