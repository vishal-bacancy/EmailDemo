class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :subject 
      t.string :description
      t.references :sent_by, foreign_key: { to_table: :users }
      t.boolean :important

      t.timestamps
    end

    create_join_table :emails, :receivers do |t|
      t.index :email_id
      t.index :receiver_id
    end
  end
end
