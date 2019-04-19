require 'user_auth'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate

  private

  def current_user

    if request.headers['Auth-Token'].present? || request.parameters['auth'].present?

      encoded_token = (request.headers['Auth-Token'].present?) ? request.headers['Auth-Token'].split(' ').last : request.parameters['auth'].split(' ').last
      decoded_token = UserAuth::Token.decode(encoded_token)
      return nil if decoded_token.expired?
      @current_user = User.find(decoded_token[:id]) rescue nil

    end

    return @current_user
  end

  helper_method :current_user

  def authenticate
    render json: {:error => 'you are not authorise to access this.'} unless current_user
  end

end
