class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string  :activity_type
      t.integer :job_id
      t.date    :activity_start
      t.text    :activity_details
      t.float   :hours
      t.string  :state
      t.string  :status
      t.timestamps
    end

    add_foreign_key "user_jobs", "activities", column: "job_id", name: "fk_activity_job"
    add_foreign_key "users", "activities", column: "user_id", name: "fk_activity_user"
  end
end
