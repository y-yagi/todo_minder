module Notifications
  class Pushbullet
    TASK_TITLE = 'TaskMinder'.freeze
    class << self
      def run
        # TODO: config per user
        user = User.first
        ::Pushbullet.api_token = Rails.application.secrets.pushbullet_key
        devices = ::Pushbullet::Device.all

        devices.each do |device|
          Task.deadline_is_close(user).each do |task|
            device.push_link(TASK_TITLE, Rails.configuration.app["host"], task.detail)
          end
        end
      end
    end
  end
end
