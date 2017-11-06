class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.integer :user_id
      t.string :school
      t.string :level
      t.string :degree
      t.string :field_of_study
      t.date  :edu_start
      t.date :edu_end
      t.text :edu_description
      t.timestamps
    end

    add_foreign_key "educations", "users", column: "user_id", name: "fk_education_user"
  end
end
