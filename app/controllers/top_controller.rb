class TopController < ApplicationController

  def index
    if user_signed_in?
      @notifications = current_user.notifications.order(created_at: :desc)
    else
      @notifications = []
    end
  end
end
