class OffersController < ApplicationController
  before_action :require_volunteer_user, only: [:new, :create]

  def index
    @offers = current_user.offers
  end

  def new
    errand = Errand.find(params[:errand_id])
    @offer = errand.offers.build
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to offers_path, notice: 'Offer sent'
    else
      render :new
    end
  end

  private

  def offer_params
    params
      .require(:offer)
      .permit(:message)
      .merge(errand_id: params[:errand_id],
             volunteer_id: current_user.volunteer_id)
  end

  def require_volunteer_user
    redirect_to root_path, alert: 'Access denied' unless current_user.volunteer?
  end
end