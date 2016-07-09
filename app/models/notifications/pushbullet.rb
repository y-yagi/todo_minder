module Notifications
  class Pushbullet
    TASK_TITLE = 'TaskMinder'.freeze
    class << self
      def run
        host = Rails.configuration.app["host"]
        # NOTE: start the server
        Net::HTTP.get(URI.parse(host))
        User.where(notification: true).each do |user|
          ::Pushbullet.api_token = user.raw_pushbullet_api_token
          devices = ::Pushbullet::Device.all

          devices.each do |device|
            Task.deadline_is_close(user).each do |task|
              device.push_link(TASK_TITLE, host, task.detail)
            end
          end
          ::Pushbullet.api_token = nil
        end
      end
    end
  end
end
