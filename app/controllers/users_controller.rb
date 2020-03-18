class UsersController < Clearance::UsersController
  before_action :redirect_signed_in_users, only: [:create, :new]
  skip_before_action :require_login, only: [:create, :new], raise: false

  layout 'authentication'

  def new
    @user = User.new(new_user_params)
    render template: "users/new"
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to url_after_create
    else
      render template: "users/new"
    end
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    case role_from_params
    when /customer/i
      new_customer_path
    when /volunteer/i
      new_volunteer_path
    else
      Clearance.configuration.redirect_url
    end
  end

  def user_from_params
    Clearance.configuration.user_model.new(user_params)
  end

  def role_from_params
    params.dig(:user, :role)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def new_user_params
    params.permit(:role)
  end
end
