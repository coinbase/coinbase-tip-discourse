class ::CoinbaseController < ::ApplicationController

  def get_tip_id
    u = User.find_by(id: params[:id])
    f = UserField.find_by(name: "Coinbase Username")

    if u.user_fields["#{f.id}"].present?
      render json: { cb_id: ERB::Util.html_escape(u.user_fields["#{f.id}"]) } and return
    end

    s = SiteSetting.where(name: "sso_url")

    if !s.blank? && s.first.value.match(/^https:\/\/www.coinbase.com\//)
      if u.single_sign_on_record != nil
        render json: { cb_id: u.single_sign_on_record["external_id"] } and return
      end
    end

    render json: { cb_id: 'coinbase' }
  end

end