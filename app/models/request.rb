class Request < ApplicationRecord
  def self.create_request(total_requested, total_accepted)
    total_rejected = total_requested - total_accepted
    request = Request.new(number_requested: total_requested, number_accepted: total_accepted, number_rejected: total_rejected)
    request.save
    request
  end

  # This function returns the sum of the submitted / accepted / denied products.
  def self.get_total_stats
    total_requested = Request.sum(:number_requested)
    total_accepted = Request.sum(:number_accepted)
    total_rejected = Request.sum(:number_rejected)
    
    return {
      total_requested: total_requested,
      total_accepted: total_accepted,
      total_rejected: total_rejected
    }
  end
end
