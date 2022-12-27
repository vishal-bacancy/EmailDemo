class EmailsReceiver < ApplicationRecord
    belongs_to :email, class_name: "Email", foreign_key: "email_id"
    belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
end
