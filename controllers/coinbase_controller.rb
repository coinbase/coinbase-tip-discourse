class ::CoinbaseController < ::ApplicationController

  def get_tip_id
    u = User.find_by(id: params[:id])
    cb_id = 'coinbase'

    if u.custom_fields["coinbase_username"] != nil
      cb_id = u.custom_fields["coinbase_username"]
    elsif u.single_sign_on_record != nil
      cb_id = u.single_sign_on_record["external_id"]
    end

    render json: { cb_id: cb_id }
  end

end