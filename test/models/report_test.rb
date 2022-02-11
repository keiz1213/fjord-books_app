# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @bob = create(:bob)
    @report = create(:first_report)
  end

  test 'should be able to edit' do
    assert @report.editable?(@report.user)
    assert_not @report.editable?(@bob)
  end

  test 'should return date object' do
    assert_kind_of(Date, @report.created_on)
  end
end
