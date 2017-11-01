class CreateUserJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_jobs do |t|
      t.integer :user_career_id
      t.integer :user_id
      t.string :company
      t.string :job_title
      t.date  :job_start
      t.date :job_end
      t.text :job_description
      t.string :status
      t.timestamps
    end
    
    add_foreign_key "user_jobs", "user_careers", column: "user_career_id", name: "fk_job_career"
    add_foreign_key "user_jobs", "users", column: "user_id", name: "fk_job_user"


    add_foreign_key "activities", "user_jobs", column: "job_id", name: "fk_activity_job"
    add_foreign_key "activities", "users", column: "user_id", name: "fk_activity_user"
  end
end
