class Group < ApplicationRecord
    has_and_belongs_to_many :users,class_name: 'User', foreign_key: :user_id
end
