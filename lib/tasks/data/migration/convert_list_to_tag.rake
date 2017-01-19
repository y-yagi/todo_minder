namespace :data do
  namespace :migration do
    desc "covert list to tag"
    task convert_list_to_tag: :environment do
      Task.includes(:list).select(&:list).each do |task|
        next if task.tags.to_a.include?(task.list.name)
        task.update(tags:  [task.list.name] + task.tags.to_a)
      end
    end
  end
end
