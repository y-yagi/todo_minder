list_ids = List.pluck(:id)
days = (1..10).to_a
hiragana = ("あ".."ん").to_a
tags_sample = %w(ダミー ねる)

30.times do |i|
  detail = rand(1..20).times.map { hiragana[rand(hiragana.size)] }.join
  tags = i % 5 == 0 ? tags_sample : []
  Task.create!(
    detail: detail,
    list_id: list_ids.sample,
    user: User.first,
    deadline_at: rand(1..10).days.since,
    tags: tags
  )
end

5.times do |_|
  detail = rand(1..20).times.map { hiragana[rand(hiragana.size)] }.join
  Task.create!(
    detail: detail,
    list_id: list_ids.sample,
    user: User.first,
    deadline_at: rand(1..10).days.since,
    status: :doing
  )
end

10.times do |_|
  detail = rand(1..20).times.map { hiragana[rand(hiragana.size)] }.join
  Task.create!(
    detail: detail,
    list_id: list_ids.sample,
    user: User.first,
    deadline_at: rand(1..10).days.since,
    status: :finished
  )
end
