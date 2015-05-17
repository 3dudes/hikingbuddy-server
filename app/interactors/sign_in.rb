class SignIn
  include Troupe

  expects :email, :password
  permits :email, :password

  def call
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      context.auth_token = AuthToken.create(user: user)
    else
      context.fail!(errors: ["Invaild email or password"])
    end
  end
end
