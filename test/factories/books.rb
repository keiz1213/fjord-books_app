# frozen_string_literal: true

FactoryBot.define do
  factory :test_book, class: Book do
    title { '呪術廻戦' }
    memo { 'ばりおもしろか〜' }
    author { '芥見下々' }
  end
end
