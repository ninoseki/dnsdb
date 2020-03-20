# frozen_string_literal: true

require "dsndb/version"

require "dsndb/clients/client"
require "dsndb/clients/lookup"
require "dsndb/clients/summarize"

require "dsndb/api"

module DNSDB
  class Error < StandardError; end
end
