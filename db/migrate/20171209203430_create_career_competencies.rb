class CreateCareerCompetencies < ActiveRecord::Migration[5.1]
  def change
    create_table :career_competencies do |t|
      t.string :career_id
      t.string :competency_id
      t.string :weight
      t.timestamps
    end

    add_foreign_key "career_competencies", "career", column: "career_id", name: "fk_careercompetencies_career"
    add_foreign_key "career_competencies", "competencies", column: "competency_id", name: "fk_careercompetencies_competency"
  end
end
