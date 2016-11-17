AtlysComplexPage::Engine.routes.draw do
  get 'admin/complex_page', to: 'pages#index', as: 'complex_pages'
  get 'admin/complex_page/new', to: 'pages#new', as: 'new_complex_page'
  get 'admin/complex_page/edit/:id', to: 'pages#edit', as: 'edit_complex_page'
  post 'admin/complex_page/create', to: 'pages#create', as: 'create_complex_page'
  post 'admin/complex_page/update', to: 'pages#update', as: 'update_complex_page'
end
