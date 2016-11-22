Rails.application.routes.draw do
  
  root                                  to: 'employees#index'
  get       '/login',                   to: 'sessions#new'
  post      '/login',                   to: 'sessions#create'
  delete    '/logout',                  to: 'sessions#destroy'
  #resources :employees

  get       'departments',              to: 'departments#index'
  get       'departments/show'
  get       'departments/new',          to: 'departments#new'
  post      'departments',              to: 'departments#create'
  get       'departments/edit'
  patch     'departments/update'
  get       'departments/destroy'

  get       'branches',                 to: 'branches#index'
  get       'branches/show'
  get       'branches/new',             to: 'branches#new'
  post      'branches',                 to: 'branches#create'
  get       'branches/edit'
  get       'branches/update'
  get       'branches/destroy'

  get       'employees',                to: 'employees#index',      as: 'list_employee'
  get       'employee/detail/:id',      to: 'employees#show',       as: 'show_employee'
  get       'employee/new',             to: 'employees#new',        as: 'new_employee'
  post      'employees',                to: 'employees#create'
  get       'employee/edit/:id',        to: 'employees#edit',       as: 'edit_employee'
  patch     'employee/update/:id',      to: 'employees#update'
  get       'employee/delete/:id',      to: 'employees#destroy',    as: 'delete_employee'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
