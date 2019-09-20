require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Wix < OmniAuth::Strategies::OAuth2
      option :name, "wix"
      option :client_options, {
        site: 'https://www.wix.com',
        authorize_url: '/app-oauth-installation/consent',
        token_url: 'app-oauth-installation/token-received'
      }

      option :authorize_params, {
        grant_type: 'authorization_code',
      }
      option :provider_ignores_state, true

      credentials do
        {
          token: access_token
        }
      end
      def authorize_params
        super.tap do |params| 
          params["redirectUrl"] = callback_url
          params["appId"] = options[:client_id] 
        end
      end

      def callback_url
        full_host + script_name + callback_path
      end

      # info do
      #   {
      #     :name => raw_info['name'],
      #     :email => raw_info['email']
      #   }
      # end

      # extra do
      #   {
      #     'raw_info' => raw_info
      #   }
      # end

      def raw_info
        @raw_info ||= access_token.params
      end
    end
  end
end
