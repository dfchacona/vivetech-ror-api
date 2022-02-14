class RequestsController < ApplicationController
  #This controller returns the total submitted / accepted / denied products. 
  def read_stats
    total_stats = Request.get_total_stats()

    render status: 200, json: total_stats
  end
end
