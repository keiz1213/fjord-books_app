# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  PER = 5

  def index
    @users = User.page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
  end
end
