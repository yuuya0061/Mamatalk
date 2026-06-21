class UsersController < ApplicationController
   allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
  end

  def show
  end
end
