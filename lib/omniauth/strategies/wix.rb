require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Wix < OmniAuth::Strategies::OAuth2
      option :name, "wix"
      option :client_options, {
        site: 'https://www.wix.com',
        authorize_url: '/app-oauth-installation/consent',
        token_url: '/oauth/access.json'
      }

      option :token_params, { headers: {'Content-Type' => 'application/json'} }
      option :provider_ignores_state, true

      uid { request.params["state"] }

      def authorize_params
        super.tap do |params| 
          params["redirectUrl"] = callback_url
          params["appId"] = options[:client_id] 
          params["token"] = request.params["token"]
        end
      end
      
      def token_params
        super.tap do |params|
          params.except(:redirect_uri)
        end
      end

      def callback_url
        full_host + script_name + callback_path
      end

      info do
        {
         :name => raw_info['name'],
         :email => raw_info['email']
        }
      end

      extra do
       {
         'raw_info' => raw_info
       }
      end

      credentials do
        {
          token: access_token.token,
          refresh_token: access_token.refresh_token,
          expires: true,
          expires_at: 10.minutes.from_now.to_i
        }
      end

      def raw_info
        @raw_info ||= access_token.params
      end
    end
  end
end
