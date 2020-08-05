class AddressesController < ApplicationController
  def show
    @address = Address.find(params[:id])
  end

  def edit
    @address = Address.find(params[:id])
    @categories = Category.all
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送情報の更新が完了しました！"
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to edit_address_path(@address.id)
    end
  end

  private
  def address_params
    params.require(:address).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :address,
      :apartment,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :tel
    )
  end
end
