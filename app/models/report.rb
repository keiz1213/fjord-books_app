# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, :content, presence: true
end
