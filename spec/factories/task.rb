FactoryBot.define do
    factory :task1, class: Task do
        id {1}
        name {"トレーニング"}
        detail {"タスクの説明文ですタスクの説明文です"}
        deadline {Date.today}
        progress {1}
        priority {1}
    end

    factory :task2, class: Task do
        id {2}
        name {"モブプロ"}
        detail {"タスクの説明文ですタスクの説明文です"}
        deadline {Date.tomorrow}
        progress {2}
        priority {2}
    end

    factory :fixed_task, class: Task do
        id { 3 }
        name { '勉強' }
        detail { 'タスクの説明文ですテスト' }
        deadline { Date.today }
        progress {1}
        priority {1}
    end
  end