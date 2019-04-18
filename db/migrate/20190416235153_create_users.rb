class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension(:citext)
    create_table :users do |t|
      t.citext :email
      t.index :email, unique: true

      t.timestamps
    end
  end
end
