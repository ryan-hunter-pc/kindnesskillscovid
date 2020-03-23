class DashboardsController < ApplicationController
  def show
    if current_user.customer?
      redirect_to errands_path
    end
  end
end
