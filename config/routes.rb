Rails.application.routes.draw do
  root 'welcome#index'

  get 'messages/reply'

  resource :messages do
    collection do
      post 'reply'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
