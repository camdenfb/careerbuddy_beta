class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.float :required_skill_multiplier
      t.float :preferred_skill_multiplier
      t.float :desired_skill_multiplier
      t.integer :total_skill_hours
      t.integer :total_career_hours
      t.float :hours_in_a_day
      t.integer :modified_by
      t.timestamps
    end
  end
end


