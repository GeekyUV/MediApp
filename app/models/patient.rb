class Patient < ApplicationRecord
  belongs_to :user
  validates :name, :email, :diagnosis, presence: true
end
