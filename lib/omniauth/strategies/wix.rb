require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Wix < OmniAuth::Strategies::OAuth2
      option :name, "wix"

      args [:grant_type, :client_id, :client_secret, :code]

      option :client_options, {
        site: 'https://www.wix.com',
        authorize_url: 'https://www.wix.com/oauth/access'
      }

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'wix', 'Wix'
