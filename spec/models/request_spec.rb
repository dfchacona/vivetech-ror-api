require 'rails_helper'

RSpec.describe Request, type: :model do
  it "request should return the sum correctly" do
    Request.create(number_requested: 3, number_accepted: 2, number_rejected: 1)
    Request.create(number_requested: 5, number_accepted: 5, number_rejected: 0)
    Request.create(number_requested: 30, number_accepted: 25, number_rejected: 5)
    
    expect(Request.get_total_stats).to eq ({
      total_requested: 38,
      total_accepted: 32,
      total_rejected: 6
    })
  end
end
