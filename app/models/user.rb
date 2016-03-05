class User < ApplicationRecord
  has_many :lists
  has_many :tasks

  class << self
    def find_or_create_from_auth_hash(auth)
      find_by(provider: auth['provider'], uid: auth['uid']) ||
        create_with_omniauth!(auth)
    end

    def create_with_omniauth!(auth)
      user = create! do |u|
        u.provider = auth['provider']
        u.uid = auth['uid']
        u.email = auth['info']['email'].presence || ''
        u.name = acquire_name_from_auth_hash(auth)
      end
      List.generate_default_lists!(user)
      user
    end

    def acquire_name_from_auth_hash(auth)
      case auth['provider']
      when 'twitter', 'facebook'
        auth['info']['nickname'].presence || auth['info']['name']
      else
        auth['info']['name']
      end
    end

    def authenticate!(user_id: nil, provider: nil)
      return nil if user_id.blank? || provider.blank?

      if provider == 'google_oauth2'
        User.find_by(email: user_id, provider: provider)
      else
        User.find_by(uid: user_id, provider: provider)
      end
    end
  end

  def update_if_needed!(auth)
    new_email = auth['info']['email']
    if new_email.present? && email != new_email
      self.email = new_email
    end

    new_name = User.acquire_name_from_auth_hash(auth)
    if new_name.present? && name != new_name
      self.name = new_name
    end
    save! if changed?
  end
end
