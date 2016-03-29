namespace :notification do
  desc "send notifications"
  task send: :environment do
    Notifications::Pushbullet.run
  end
end
