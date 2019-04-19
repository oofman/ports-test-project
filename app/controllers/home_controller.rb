class HomeController < ApplicationController
  skip_before_action :authenticate, only: [:index]

  def index
    render json: { :info => 'Are you sure you should be here?'}
  end

end
