# frozen_string_literal: true

FactoryBot.define do
  factory :user1, class: User do
    id { 1 }
    name { 'user1' }
    email { Faker::Internet.free_email }
    password_digest { 'user1' }
  end

  factory :user2, class: User do
    id { 2 }
    name { 'user2' }
    email { Faker::Internet.free_email }
    password_digest { 'user2' }
  end

  factory :task1, class: Task do
    id { 1 }
    name { 'トレーニング' }
    detail { 'タスクの説明文ですタスクの説明文です' }
    deadline { Time.zone.today }
    progress { 1 }
    priority { 1 }
    user_id { 1 }
  end

  factory :task2, class: Task do
    id { 2 }
    name { 'モブプロ' }
    detail { 'タスクの説明文ですタスクの説明文です' }
    deadline { Date.tomorrow }
    progress { 2 }
    priority { 2 }
    user_id { 2 }
  end

  factory :fixed_task, class: Task do
    id { 3 }
    name { '勉強' }
    detail { 'タスクの説明文ですテスト' }
    deadline { Time.zone.today }
    progress { 1 }
    priority { 1 }
    user_id { 2 }
  end
end
