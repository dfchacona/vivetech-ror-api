class RequestsController < ApplicationController
  def read_all
    requests = Request.all

    render status: 200, json: requests
  end

  def read_stats
    total_stats = Request.get_total_stats()

    render status: 200, json: total_stats
  end
end
