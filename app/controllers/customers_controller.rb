class CustomersController < ApplicationController
  layout 'authentication'

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to dashboard_path, notice: 'Account created successfully'
    else
      render :new
    end
  end

  private

  def customer_params
    params
      .require(:customer)
      .permit(:first_name, :last_name, :phone,
              :address, :unit, :city, :state, :zip)
      .merge(user_id: current_user.id)
  end
end
