class ErrandsController < ApplicationController
  def index
    @errands = current_user.errands.order(:status)
  end

  def search
    @errands = Errand.requested.order(created_at: :desc).limit(10)
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

  def edit
    @errand = Errand.find(params[:id])
  end

  def update
    @errand = Errand.find(params[:id])
    if @errand.update(errand_params)
      redirect_to @errand, notice: 'Errand saved'
    else
      render :edit
    end
  end

  def destroy
    @errand = Errand.find(params[:id])
    @errand.destroy
    redirect_to errands_path, notice: 'Errand deleted'
  end

  private

  def errand_params
    params
      .require(:errand)
      .permit(:status, :short_description, :full_description)
      .merge(customer_id: current_user.customer.id)
  end
end
