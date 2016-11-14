class Auths::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      jwt = JsonWebToken.encode({user_id: user.id})
    end
    redirect_to "http://localhost:4000?jwt=#{jwt}"
  end
end
