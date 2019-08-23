class SecretCode < ApplicationRecord
  belongs_to :user, optional: true

  scope :available_codes, -> { where(user_id: nil) }
end
