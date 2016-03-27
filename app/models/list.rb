class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :name, presence: true

  class << self
    def generate_default_lists!(user)
      # TODO: i18n対応は後から考える
      List.create!(name: '今日やること', user: user)
      List.create!(name: '仕事', user: user)
      List.create!(name: '個人', user: user)
    end

    def build(params, current_user)
      list= List.new(params)
      list.user = current_user
      list
    end
  end
end
