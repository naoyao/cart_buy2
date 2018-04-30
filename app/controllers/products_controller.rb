class ProductsController < ApplicationController

  # 商品一覧画面
  def index
    @products = Product.all
  end

  def show
    # 全ての情報を取ってくる　each文(多くの情報の中から一つだけ取ってくる)を使えるのはこっち。
    # @products = Product.where.limit(5)
    @products = Product.all
    # そもそも「一つ」の情報の中にあるidやnameなどのカラムしか取ってこれない。
    # 一つの情報しか取れないので、そもそも　each文　での使用は不可。
    @product = Product.find(params[:id])
  end

  # private
  # def product_params
  #   # binding.pry
  #   params.require(:product).permit(:id, :price , :name, :image, :shopname)
  # end
end
