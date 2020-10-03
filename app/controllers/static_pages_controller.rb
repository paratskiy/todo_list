class StaticPagesController < ApplicationController
  def home
    return unless user_signed_in?

    @projects = current_user.projects
  end
end
