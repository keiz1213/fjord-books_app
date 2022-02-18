# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  def setup
    create(:first_report)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_selector 'tr', text: 'こんにちは'
  end

  test 'creating a report' do
    visit reports_url
    click_link '新規作成'
    fill_in 'タイトル', with: 'こんにちは'
    fill_in '内容', with: '今日は暖かいです'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text 'こんにちは'
    assert_text '今日は暖かいです'
    assert_text 'alice'
    click_on '戻る'
  end

  test 'updating a report' do
    visit reports_url
    click_link '編集'
    fill_in 'タイトル', with: 'こんばんは'
    fill_in '内容', with: '今日も寒すぎます'
    click_button '更新する'

    assert_text '日報が更新されました。'
    assert_text 'こんばんは'
    assert_text '今日も寒すぎます'
    assert_text 'alice'
    click_on '戻る'
  end

  test 'destroying a report' do
    visit reports_url
    accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end
