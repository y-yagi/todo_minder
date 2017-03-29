class Task < ApplicationRecord
  belongs_to :user

  validates :detail, presence: true

  after_destroy :generate_deleted_task

  scope :deadline_is_close, -> (user, range_end = 1.hour.since) do
    where(deadline_at: [Time.current..range_end])
  end

  enum status: [:wait, :doing, :finished]

  class << self
    def build(params, current_user)
      task = Task.new(params)
      task.user = current_user
      task
    end

    def with_tag(tag)
      if tag
        where("tags @> ARRAY[?]::varchar[]", tag)
      else
        all
      end
    end
  end

  def generate_deleted_task
    attributes = self.attributes.except('id', 'created_at', 'updated_at')
    DeletedTask.create!(attributes)
  end
end
