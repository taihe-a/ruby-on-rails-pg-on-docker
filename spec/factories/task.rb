FactoryBot.define do
    factory :task do
        sequence(:id) do |n| n end
        sequence(:name) do |n| "タスク#{n}" end
        sequence(:detail) do |n| "タスク#{n}の説明文です#{n}" end
        sequence(:deadline, Date.today)
    end

    factory :fixed_task, class: Task do
        id { 2 }
        name { '勉強' }
        detail { 'タスクの説明文ですテスト' }
        deadline { '2020-04-04' }
    end
  end