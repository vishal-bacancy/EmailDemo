class CreateEmailGroups < ActiveRecord::Migration[7.0]
  def change
    create_join_table :emails, :groups do |t|
      t.index :email_id
      t.index :group_id
    end
  end
end
