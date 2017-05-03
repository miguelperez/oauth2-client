module OAuth2Client
  module Grant
    class RefreshToken < Base

      def grant_type
        'refresh_token'
      end

      # Retrieve an access token for a given refresh token
      #
      # @param [String] refresh_token     refresh token
      # @param [Hash]   opts options
      def get_token(refresh_token, opts={})
        opts[:params] = {
          :grant_type    => grant_type,
          :refresh_token => refresh_token
        }.merge(opts.fetch(:params, {}))

        opts[:authenticate] ||= :headers
        method = opts.delete(:method) || :post
        make_request(method, @token_path, opts)
      end
    end
  end
end
