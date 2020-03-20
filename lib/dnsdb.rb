# frozen_string_literal: true

require "dnsdb/version"

require "dnsdb/clients/client"
require "dnsdb/clients/lookup"
require "dnsdb/clients/summarize"

require "dnsdb/api"

module DNSDB
  class Error < StandardError; end
end
