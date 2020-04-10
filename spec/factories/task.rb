# frozen_string_literal: true

FactoryBot.define do
  sequence(:uer_id, 1)
  sequence(:task_id, 1)
  sequence(:user_name, "name_1")
  sequence(:user_pass, "pass_1")
  sequence(:date, Time.zone.today)

  factory :user, class: User do
    id { generate :uer_id }
    name { generate :user_name }
    email { Faker::Internet.free_email }
    password_digest { generate :user_pass }
  end

  factory :task do
    id { generate :task_id }
    name { 'トレーニング' }
    detail { 'タスクの説明文ですタスクの説明文です' }
    deadline { generate :date  }
    progress { 1 }
    priority { 1 }
    user
  end
end