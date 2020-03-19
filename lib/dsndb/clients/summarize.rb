# frozen_string_literal: true

module DNSDB
  module Clients
    class Summarize < Client
      def rdata(type:, value:, rrtype: "ANY", **params)
        path = if type == "ip"
                 "/summarize/rdata/ip/#{value}"
               elsif rrtype
                 "/summarize/rdata/name/#{value}/#{rrtype}"
               else
                 "/summarize/rdata/name/#{value}"
               end

        _get(path, params, &:first)
      end

      def rrset(owner_name:, rrtype: nil, bailiwick: nil, **params)
        path = if bailiwick
                 rrtype ||= "ANY"
                 "/summarize/rrset/name/#{owner_name}/#{rrtype}/#{bailiwick}"
               elsif rrtype
                 "/summarize/rrset/name/#{owner_name}/#{rrtype}"
               else
                 "/summarize/rrset/name/#{owner_name}"
               end

        _get(path, params, &:first)
      end
    end
  end
end
