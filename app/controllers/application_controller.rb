class ApplicationController < ActionController::Base
  # Railsが生成するすべてのフォームやAjaxリクエストで自動的にセキュリティトークンを含めるもの
  # もしセキュリティトークンが想定されている値と一致しなければ、例外（エラー）が投げられます。
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # helper_method :current_cart
  #
  # # session[:名前] はRailsにあらさじめ組み込まれているメソッドで、名前をつけて、セッションに登録できます。
  # # たったこれだけのメソッドで、簡単にセッションの設定ができます。
  # def current_cart
  #   if session[:cart_id]
  #     @cart = Cart.find(session[:cart_id])
  #   else
  #     @cart = Cart.create
  #     session[:cart_id] = @cart.id
  #   end
  # end
end
