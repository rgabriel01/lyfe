class EarlyRegistrantsController < ApplicationController
  before_action :parse_parameters, only: [:create]
  
  attr_accessor :parameters

  def create
    er = EarlyRegistrant.new(parameters)
    res = er.save

    message = res ? {success: 'Registration Saved!'} : {error: 'Unable to save registration'}
    redirect_to teaser_index_path, flash: message
  end

  private

  def parse_parameters
    full_name = "#{params[:name]} #{params[:surname]}"
    @parameters = {full_name: full_name, email: params[:email]}
  end
end
