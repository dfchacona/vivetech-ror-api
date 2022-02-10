Rails.application.routes.draw do

  get "/products", to: "products#read_all"
  get "/product/:id", to: "products#read"
  post "/products", to: "products#create"

  get "/stats", to: "requests#read_stats"
  # get "/requests", to: "requests#read"
end
