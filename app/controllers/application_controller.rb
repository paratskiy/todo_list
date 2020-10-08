class ApplicationController < ActionController::Base
  def set_errors(object)
    session[:errors] = object.errors.full_messages
  end
end
