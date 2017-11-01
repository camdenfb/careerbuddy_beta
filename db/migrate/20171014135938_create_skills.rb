class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :skill_title
      t.string :skill_description
      t.string :status
      t.timestamps
    end
  end
end
