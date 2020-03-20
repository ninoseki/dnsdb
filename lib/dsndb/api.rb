# frozen_string_literal: true

module DNSDB
  class API
    def initialize(api_key = ENV["DNSDB_API_KEY"])
      @api_key = api_key
    end

    def lookup
      @lookup ||= Clients::Lookup.new(@api_key)
    end

    def summarize
      @summarize ||= Clients::Summarize.new(@api_key)
    end
  end
end
