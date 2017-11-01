class CreateUserCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_careers do |t|
      t.integer :user_id
      t.integer :career_id
      t.date :career_start
      t.date :career_end
      t.text :career_description
      t.string :status
      t.timestamps
    end

    add_foreign_key "user_careers", "users", column: "user_id", name: "fk_usercareer_user"
    add_foreign_key "user_careers", "careers", column: "career_id", name: "fk_usercareer_career"
  end
end
