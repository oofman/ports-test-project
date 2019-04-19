class PortsController < ApplicationController
  skip_before_action :authenticate, only: [:index]

  def index

    render json: PortDetail.new(params).list
  end

  def import

  end

end
