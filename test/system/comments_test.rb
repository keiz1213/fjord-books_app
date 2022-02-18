# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  def setup
    create(:alice)
    create(:second_report)
    create(:test_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'comment on the report ' do
    visit reports_url
    click_link '詳細'
    fill_in 'comment[content]', with: 'こんにちは'
    click_button 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text 'こんにちは'
    click_on '戻る'
  end

  test 'comment on the book ' do
    visit books_url
    click_link '詳細'
    fill_in 'comment[content]', with: '最高ですね'
    click_button 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text '最高ですね'
    click_on '戻る'
  end
end
