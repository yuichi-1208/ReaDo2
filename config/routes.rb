Rails.application.routes.draw do
  resources :books do
    resources :summaries, :memos, only: [:new, :create]
    resources :reviews
  end

  resources :summaries do
    resources :comments
  end
end
