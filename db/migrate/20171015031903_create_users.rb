class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :role
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.text :summary
      t.string :email
      t.string :location
      t.string :contact_no
      t.string :website
      t.string :photo
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
