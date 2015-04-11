Rails.application.routes.draw do
  resources :posts
  get "view-set-page-title", to: "welcome#view_set_page_title", as: :view_set_page_title

  root "welcome#index"
end
