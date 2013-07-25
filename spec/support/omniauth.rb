OmniAuth.config.test_mode = true

def stub_auth_response(user, provider = :facebook)
  OmniAuth.config.test_mode = true

  if user.persisted? && user.identities.empty?
    user.identities << FactoryGirl.build("#{provider}_identity", user: user)
    user.save!
  end

  stub_omniauth(provider, user)
end

def stub_auth_registration(provider = :facebook)
  stub_omniauth(provider)
end

def stub_omniauth(provider, user = nil)
  if !user
    user = FactoryGirl.build(:user)
  end

  info = {
    'provider' => provider,
    'uid'   => user.persisted? ? user.identities.where(provider: provider).first.try(:uid) : FactoryGirl.generate(:uid),
    'info' => {
      'email' => user.email
    }
  }

  OmniAuth.config.mock_auth[:facebook] = info
end
