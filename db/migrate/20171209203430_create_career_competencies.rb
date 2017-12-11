class CreateCareerCompetencies < ActiveRecord::Migration[5.1]
  def change
    create_table :career_competencies do |t|
      t.integer :career_id
      t.integer :competency_id
      t.string :weight
      t.timestamps
    end

    add_foreign_key "career_competencies", "careers", column: "career_id", name: "fk_careercompetencies_career"
    add_foreign_key "career_competencies", "competencies", column: "competency_id", name: "fk_careercompetencies_competency"
  end
end
