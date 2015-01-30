require 'pathname'

class ::CoinbaseController < ::ApplicationController
  def tip_id
    @u = User.find_by(id: params[:id])
    @f = UserField.find_by(name: 'Coinbase Username')

    if @u.user_fields["#{@f.id}"].present?
      return render json: { cb_id: clean_username }
    end

    @s = SiteSetting.where(name: 'sso_url')

    if !@s.blank? && @s.first.value.match(%r{^https://www.coinbase.com/})
      unless @u.single_sign_on_record.nil?
        return render json: { cb_id: @u.single_sign_on_record['external_id'] }
      end
    end

    render json: { cb_id: 'coinbase' }
  end

  private

  def clean_username
    Pathname.new(ERB::Util.html_escape(@u.user_fields["#{@f.id}"])).basename.to_s
  end
end
