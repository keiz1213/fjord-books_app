# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @alice = create(:alice)
    @bob = create(:bob)
  end

  test 'should return name or email' do
    assert_equal 'alice', @alice.name_or_email
    @alice.name = ''
    assert_equal 'alice@example.com', @alice.name_or_email
  end

  test 'should follow and unfollow other user' do
    assert_not @alice.following?(@bob)
    assert_not @bob.followed_by?(@alice)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    assert @bob.followed_by?(@alice)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
    assert_not @bob.followed_by?(@alice)
  end
end
