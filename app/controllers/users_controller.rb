class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end


# who made the post? look at the documentation
# who can destroy the posts
