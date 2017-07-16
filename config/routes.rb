Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      confirmations:        'overrides/confirmations',
      omniauth_callbacks:   'overrides/omniauth_callbacks',
      passwords:            'overrides/passwords',
      registrations:        'overrides/registrations',
      sessions:             'overrides/sessions',
      token_validations:    'overrides/token_validations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
