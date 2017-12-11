class CreateActivityCompetencies < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_competencies do |t|
      t.integer :activity_id
      t.integer :competency_id
      t.timestamps
    end

    add_foreign_key "activity_competencies", "activities", column: "activity_id", name: "fk_activitycompetencies_activity"
    add_foreign_key "activity_competencies", "competencies", column: "competency_id", name: "fk_activitycompetencies_competency"
  end
end
