# frozen_string_literal: true

require "json"
require "net/https"
require "uri"

module DNSDB
  module Clients
    class Client
      HOST = "api.dnsdb.info"
      BASE_URL = "https://#{HOST}"

      def initialize(api_key)
        @api_key = api_key
      end

      private

      def url_for(path)
        URI(BASE_URL + path)
      end

      def https_options
        if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
          uri = URI(proxy)
          {
            proxy_address: uri.hostname,
            proxy_port: uri.port,
            proxy_from_env: false,
            use_ssl: true
          }
        else
          { use_ssl: true }
        end
      end

      def make_request(req)
        Net::HTTP.start(HOST, 443, https_options) do |http|
          response = http.request(req)

          code = response.code.to_i
          body = response.body

          case code
          when 200
            json = body.lines.map do |line|
              JSON.parse line.chomp
            end
            yield json
          else
            error = body.chomp
            raise Error, "Unsupported response code returned: #{code} - #{error}"
          end
        end
      end

      def build_request(type: "GET", path:, params: {}); end

      def _get(path, params, &block)
        uri = url_for(path)
        uri.query = URI.encode_www_form(params)
        request = Net::HTTP::Get.new(uri)

        request["Accept"] = "application/json"
        request["X-Api-Key"] = @api_key

        make_request(request, &block)
      end
    end
  end
end
