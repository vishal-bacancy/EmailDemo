class CreateUserGroups < ActiveRecord::Migration[7.0]
  def change

    create_table :groups do |t|
      t.string :name
    
      t.timestamps
    end
    
    create_table :groups_users,  id: false do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
