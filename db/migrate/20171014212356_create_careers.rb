class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string :career_title
      t.string :career_description
      t.string :status
      t.timestamps
    end
  end
end
