class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :detail, presence: true
end
