class AcceptancesController < ApplicationController
  def create
    @acceptance = Acceptance.new(acceptance_params)

    if @acceptance.save
      redirect_to @acceptance.errand, notice: 'Offer accepted'
    else
      redirect_to @acceptance.errand, alert: 'Oops, there was and error. Please try again'
    end
  end

  private

  def acceptance_params
    params.permit(:offer_id)
  end
end
