require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Wix < OmniAuth::Strategies::OAuth2
      option :name, "wix"

      args [:client_id, :client_secret]

      option :client_options, {
        site: 'https://www.wix.com',
        authorize_url: 'oauth/access',
        token_url: 'oauth/access'
      }

      option :authorize_params, {grant_type: 'authorization_code'}
      option :provider_ignores_state, true

      def callback_url
        options[:callback_url]
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

      # def raw_info
      #   @raw_info ||= access_token.get('/me').parsed
      # end
    end
  end
end
