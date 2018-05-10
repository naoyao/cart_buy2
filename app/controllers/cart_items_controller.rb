class CartItemsController < ApplicationController

    # before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

    def show
      @cart_items = current_user.cart_items
    end

    # 商品一覧画面から、「商品購入」を押した時のアクション
    def new
      @cart_item = CartItem.new
      @cart_items = current_user.cart_items
      # binding.pry
    end

    def create
      # binding.pry
      @cart_item = CartItem.new(cart_item_params)
      # binding.pry
      # @cart_item = CartItem.find(cart_item_params)

      # if @cart_item.blank?
      #   @cart_item = current_user.cart_items.build(product_id: params[:product_id])
      # end

      # binding.pry
      # @cart_item.quantity = params[:quantity].to_i
      # binding.pry
      # @cart_item.save(cart_item_params)
      @cart_item.save

      redirect_to controller: 'cart_items', action: 'new'
    end

    # カート詳細画面から、「更新」を押した時のアクション
    def update
      @cart_item.update(quantity: params[:quantity].to_i)
      redirect_to current_user
    end

    def delete
      @cart_item.destroy
      redirect_to current_user
    end

    private
    def setup_cart_item!
      @cart_item = current_user.cart_items.find_by(product_id: params[:product_id])
    end

    def cart_item_params
      params.permit(:quantity, :product_id).merge(user_id: current_user.id)
      # params.permit(:quantity).merge(user_id: current_user.id, product_id: params[:product_id])
      # params.permit(:cart_item).merge(quantity: params[:quantity].to_i, user_id: current_user.id, product_id: params[:product_id])
    end

end
