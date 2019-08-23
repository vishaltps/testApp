class SecretCodesController < ApplicationController
	load_and_authorize_resource

  def index
  	@secret_codes = SecretCode.includes(:user).all
  end

  def create
  	params[:generate_number].to_i.times { SecretCode.create(code: SecureRandom.hex(3)) }
  	flash[:notice] =  "#{params[:generate_number]} secret codes generated successfully"
  	redirect_back(fallback_location: secret_codes_path)
  end
end
