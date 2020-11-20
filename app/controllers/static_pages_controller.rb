class StaticPagesController < ApplicationController
  after_action :clear_errors, only: %i[home]

  def home
    return unless user_signed_in?

    @projects = current_user.projects
  end

  private

  def clear_errors
    session[:errors] = nil
  end
end
