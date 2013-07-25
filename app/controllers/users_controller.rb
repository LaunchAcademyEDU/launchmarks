class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_edit, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  protected
  def authorize_edit
    if @user && !@user.editable_by?(current_user)
      access_denied
    end
  end

  def user_params
    params.permit(user: User.mass_assignable_attrs)[:user]
  end
end
