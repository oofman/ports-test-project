class PortsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate, only: [:index]

  def index

    render json: ports_service.list
  end

  def create

    render json: ports_service.import
  end


  private

  def ports_service
    PortDetail.new(params)
  end

end
