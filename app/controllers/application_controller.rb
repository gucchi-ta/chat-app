class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?    #nicknameカラムの保存を可能にする。
                                                                            #Railsでは、悪意のあるユーザーの入力に対してセキュリティ対策を行わないと保存できない仕組みがあるので、devise_parameter_sanitizerメソッドを使用し特定のカラムを許容する。
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
