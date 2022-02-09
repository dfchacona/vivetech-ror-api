Rails.application.routes.draw do

  get "/products", to: "products#read_all"

end
