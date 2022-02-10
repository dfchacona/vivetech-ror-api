class RequestsController < ApplicationController
  def read_all
    requests = Request.all

    render status: 200, json: requests
  end

  def read_stats
    stats = []

    total_requested = Request.sum(:number_requested)
    total_accepted = Request.sum(:number_accepted)
    total_rejected = Request.sum(:number_rejected)

    stats << {
      total_requested: total_requested,
      total_accepted: total_accepted,
      total_rejected: total_rejected
    }

    render status: 200, json: stats
  end
end
