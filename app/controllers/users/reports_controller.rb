# frozen_string_literal: true

class Users::ReportsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reports = @user.reports.order(id: :desc).page(params[:page])
  end
end