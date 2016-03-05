class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :detail, presence: true

  class << self
    def build(params, current_user)
      task = Task.new(params)
      task.user = current_user
      task
    end
  end
end
