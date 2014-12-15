class ::CoinbaseController < ::ApplicationController

  def get_tip_id
    u = User.find_by(id: params[:id])
    f = UserField.find_by(name: "Coinbase Username")

    cb_id = 'coinbase'

    if u.user_fields["#{f.id}"] != nil
      cb_id = u.user_fields["#{f.id}"]
    elsif u.single_sign_on_record != nil
      cb_id = u.single_sign_on_record["external_id"]
    end

    render json: { cb_id: cb_id }
  end

end