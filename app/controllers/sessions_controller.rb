class SessionsController < ApplicationController
  skip_before_action :authenticate
  skip_before_action :verify_authenticity_token, only: [:create]

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id

      _user = user.attributes
      _user.delete('password_digest')
      render json: {:user => _user, :token => user.token}

    else
      render json: {:error => 'you are not authorise to access this.'}

    end
  end

end
