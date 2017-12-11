class CreateCompetencies < ActiveRecord::Migration[5.1]
  def change
    create_table :competencies do |t|
      t.string :competency_title
      t.string :competency_description
      t.string :status
      t.timestamps
    end
  end
end
