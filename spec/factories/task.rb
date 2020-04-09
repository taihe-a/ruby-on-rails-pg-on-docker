# frozen_string_literal: true

FactoryBot.define do
  sequence(:u_id, 1)
  sequence(:user_name, "name_1")
  sequence(:user_pass, "pass_1")

  factory :user, class: User do
    id { generate :u_id }
    name { generate :user_name }
    email { Faker::Internet.free_email }
    password_digest { generate :user_pass }
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
