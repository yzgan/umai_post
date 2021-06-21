class CreateLogins < ActiveRecord::Migration[6.1]
  def change
    create_table :logins do |t|
      t.string :ip_address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
