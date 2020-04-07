def tasks
    (1..100).each do |i|
        Task.create(
            id: i,
            name: "タスク#{i}", 
            detail: "タスク詳細表示タスク詳細表示#{i}", 
            deadline: Faker::Date.between(from: Date.today, to: 1.month.ago),
            progress: Faker::Number.between(from: 1, to: 3),
        )
    end
end

tasks