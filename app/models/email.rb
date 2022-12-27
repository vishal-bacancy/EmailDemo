class Email < ApplicationRecord
    belongs_to :sent_by, class_name: 'User'
    # has_many :sent_to, class_name: 'User', foreign_key: :sent_to
    # has_and_belongs_to_many :receivers, join_table: "emails_receivers", foreign_key: "user_id", class_name: 'User', :inverse_of => :emails
    # has_rich_text :description
    has_many :emails_receivers
    has_many :receivers, through: :emails_receivers
    has_and_belongs_to_many :groups

end
