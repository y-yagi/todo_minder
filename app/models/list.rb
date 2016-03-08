class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  class << self
    def generate_default_lists!(user)
      # TODO: i18n対応は後から考える
      List.create!(name: '今日やること', user: user)
      List.create!(name: '仕事', user: user)
      List.create!(name: '個人', user: user)
    end
  end
end
