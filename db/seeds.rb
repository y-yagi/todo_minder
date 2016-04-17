list_ids = List.pluck(:id)
days = (1..10).to_a
hiragana = ("あ".."ん").to_a

30.times do |_|
  detail = rand(1..20).times.map { hiragana[rand(hiragana.size)] }.join
  Task.create!(
    detail: detail,
    list_id: list_ids.sample,
    user: User.first,
    deadline_at: rand(1..10).days.since
  )
end
