class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :subject 
      t.string :description
      t.string :sent_by
      t.string :sent_to
      t.boolean :important

      t.timestamps
    end
  end
end
