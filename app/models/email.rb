class Email < ApplicationRecord
    has_many :sent_by, class_name: 'User', foreign_key: :sent_by
    has_many :sent_to, class_name: 'User', foreign_key: :sent_by
    has_rich_text :description

end
