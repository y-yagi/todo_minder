class AddPushbulletApiTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pushbullet_api_token, :string
  end
end
