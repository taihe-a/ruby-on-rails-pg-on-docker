# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "name_#{n}" }
    email { Faker::Internet.free_email }
    sequence(:password_digest) { |n| "pass_#{n}" }
  end

  factory :task do
    sequence(:id) { |n| n }
    name { 'トレーニング' }
    detail { 'タスクの説明文ですタスクの説明文です' }
    sequence(:deadline) { |n| (Time.zone.today + n.days).to_s }
    progress { 1 }
    priority { 1 }
    user
  end
end
