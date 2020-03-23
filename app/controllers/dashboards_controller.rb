class DashboardsController < ApplicationController
  def show
    if current_user.customer? || current_user.volunteer?
      redirect_to errands_path
    end
  end
end
