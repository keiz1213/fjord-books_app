# frozen_string_literal: true

FactoryBot.define do
  factory :first_report, class: Report do
    association :user, factory: :alice
    title { 'こんにちは' }
    content { '今日は寒いです' }
  end

  factory :second_report, class: Report do
    association :user, factory: :bob
    title { 'はじめまして' }
    content { '今日は暑いです' }
  end
end
