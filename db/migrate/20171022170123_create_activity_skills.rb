class CreateActivitySkills < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_skills do |t|
      t.integer :activity_id
      t.integer :skill_id
      t.timestamps
    end

    
    add_foreign_key "activity_skills", "activities", column: "activity_id", name: "fk_activityskills_activity"
    add_foreign_key "activity_skills", "skills", column: "skill_id", name: "fk_activityskills_skill"
  end
end
