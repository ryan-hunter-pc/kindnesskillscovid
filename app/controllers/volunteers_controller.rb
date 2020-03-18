class VolunteersController < ApplicationController
  layout 'authentication'

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      redirect_to dashboard_path, notice: 'Account created successfully'
    else
      render :new
    end
  end

  private

  def volunteer_params
    params
      .require(:volunteer)
      .permit(:first_name, :last_name, :phone,
              :address, :unit, :city, :state, :zip)
      .merge(user_id: current_user.id)
  end
end
