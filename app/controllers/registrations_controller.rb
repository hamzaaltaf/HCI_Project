class RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:firstname,:lastname, :email,:password,:password_confirmation,:phone)
    end
    def account_update_params
      params.require(:user).permit(:firstname,:lastname, :email,:password,:password_confirmation,:image,:phone, :current_password,:skills)
    end
end