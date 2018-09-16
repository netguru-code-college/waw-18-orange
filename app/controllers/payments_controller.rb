class PaymentsController < ApplicationController
  before_action :set_payment, only: [:update]

  def update
    @payment.update(paid: params[:paid])
    redirect_back(fallback_location: root_path)
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end
end
