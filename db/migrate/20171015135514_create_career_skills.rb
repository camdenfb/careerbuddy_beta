class CreateCareerSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :career_skills do |t|
      t.integer :user_career_id
      t.integer :skill_id
      t.string  :weight
      t.string :status
      t.timestamps
    end

    add_foreign_key "user_careers", "career_skills", column: "user_career_id", name: "fk_careerskill_career"
    add_foreign_key "skills", "career_skills", column: "skill_id", name: "fk_careerskill_skill"
  end
end
