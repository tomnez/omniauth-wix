require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Wix < OmniAuth::Strategies::OAuth2
      option :name, "wix"

      args [:grant_type, :client_id, :client_secret, :code]

      option :client_options, {
        site: 'https://www.wix.com',
        authorize_url: 'oauth/access',
        token_url: 'oauth/access'
      }

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
