class PurchasesController < ApplicationController
  require 'payjp'

  def show
    @product = Product.find_by(params[:id])

    if user_signed_in?
      card = CreditCard.where(user_id: current_user.id).first
      @user = User.find_by(id: current_user.id)
    else
      flash[:alert] = "商品を購入するにはログインしてください"
      redirect_to root_path and return
    end

    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_credit_card_path
      flash[:alert] = "商品を購入するにはクレジットカードの登録をしてください。" 
    else
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_token)
    end

  end



  def pay
    card = CreditCard.where(user_id: current_user.id).first
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    Payjp::Charge.create(
      amount: @product.price, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると生成されるトークン
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    @product.update(buy_user_id: current_user.id)
    redirect_to root_path
    flash[:notice] = "商品の購入が完了しました"
  end

  private
  def purchase_params
    params.require(:product).merge(buy_user_id: current_user.id)
  end

end
