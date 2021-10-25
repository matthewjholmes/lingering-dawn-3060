class MechanicRidesController < ApplicationController

  def create
    MechanicRide.create(m_r_params)
    redirect_to mechanic_path(params[:mechanic_id])
  end

  private

  def m_r_params
    params.permit(:ride_id, :mechanic_id)
  end
end
