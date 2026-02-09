Rails.application.routes.draw do
  root "home#index"

  get "/published_courses", to: "home#published_courses"
end
