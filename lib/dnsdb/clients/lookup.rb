# frozen_string_literal: true

module DNSDB
  module Clients
    class Lookup < Client
      def rdata(type:, value:, rrtype: nil, **params)
        path = if type == "ip"
                 "/lookup/rdata/ip/#{value}"
               elsif rrtype
                 "/lookup/rdata/name/#{value}/#{rrtype}"
               else
                 "/lookup/rdata/name/#{value}"
               end

        _get(path, params) { |json| json }
      end

      def rrset(owner_name:, rrtype: nil, bailiwick: nil, **params)
        path = if bailiwick
                 rrtype ||= "ANY"
                 "/lookup/rrset/name/#{owner_name}/#{rrtype}/#{bailiwick}"
               elsif rrtype
                 "/lookup/rrset/name/#{owner_name}/#{rrtype}"
               else
                 "/lookup/rrset/name/#{owner_name}"
               end

        _get(path, params) { |json| json }
      end
    end
  end
end
