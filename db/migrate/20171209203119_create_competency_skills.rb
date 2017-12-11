class CreateCompetencySkills < ActiveRecord::Migration[5.1]
  def change
    create_table :competency_skills do |t|
      t.integer :skill_id
      t.integer :competency_id
      t.string :weight
      t.timestamps
    end

    add_foreign_key "competency_skills", "skills", column: "skill_id", name: "fk_competencyskills_skill"
    add_foreign_key "competency_skills", "competencies", column: "competency_id", name: "fk_competencyskills_competency"
  end
end

