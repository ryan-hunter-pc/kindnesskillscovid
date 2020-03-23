class ErrandsController < ApplicationController
  def index
    @errands = current_user.errands
  end

  def show
    @errand = Errand.find(params[:id])
  end

  def new
    @errand = Errand.new
  end

  def create
    @errand = Errand.new(errand_params)
    if @errand.save
      redirect_to @errand, notice: 'Errand saved'
    else
      render :new
    end
  end

  private

  def errand_params
    params
      .require(:errand)
      .permit(:short_description, :full_description)
      .merge(customer_id: current_user.customer.id)
  end
end
