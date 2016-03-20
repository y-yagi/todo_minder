module Notifications
  class Pushbullet
    TASK_TITLE = 'TaskMinder'.freeze
    class << self
      def run
        # TODO: config per user
        user = User.first
        ::Pushbullet.api_token = Rails.application.secrets.pushbullet_key
        devices = ::Pushbullet::Device.all

        Task.deadline_is_close(user).each do |task|
          devices.first.push_note(TASK_TITLE, task.detail)
        end
      end
    end
  end
end
