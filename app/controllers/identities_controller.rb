class IdentitiesController < ApplicationController
  def create
    # every time a user authenticates, save updated token, expiration, and permissions
    # (using params[:state] to pass the extended permissions we wanted, if any)
    @possible_identity = Identity.find_by_auth_hash(auth)

    if @possible_identity
      flash[:notice] = t("devise.sessions.signed_in")
      sign_in(:user, @possible_identity.user)
      redirect_to root_path
    else
      @identity = Identity.build_from_auth_hash(auth)
      if @identity.save
        sign_in(:user, @identity.user)
        flash[:notice] = t("devise.registrations.signed_up")
        redirect_to root_path
      end
    end
  end

  protected
  def auth
    @auth ||= request.env["omniauth.auth"]
  end
end
