# dnsdb

[![Build Status](https://travis-ci.com/ninoseki/dnsdb.svg?branch=master)](https://travis-ci.com/ninoseki/dnsdb)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/dnsdb/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/dnsdb?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/dnsdb/badge)](https://www.codefactor.io/repository/github/ninoseki/dnsdb)

DNSDB API wrapper for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dsndb'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install dsndb
```

## Usage

```ruby
# when given nothing, it tries to load your API key via ENV["DNSDB_API_KEY"]
api = DNSDB::API.new
# or you can set it manually
api = DNSDB::API.new("YOUR_API_KEY")

api.lookup.rdata(value: "10.0.0.1", type: "ip")
api.lookup.rdata(value: "github.com", type: "name")

api.lookup.rrset(owner_name: "www.farsightsecurity.com")
api.lookup.rrset(owner_name: "*.farsightsecurity.com", rrtype: "ns", bailiwick: "farsightsecurity.com")
api.lookup.rrset(owner_name: "*.farsightsecurity.com", rrtype: "ns", bailiwick: "farsightsecurity.com", limit: 100, time_last_after: 1_468_281_600)

api.summarize.rdata(rrtype: "ANY", value: "10.0.0.1", type: "ip")
api.summarize.rdata(value: "github.com", type: "name")

api.summarize.rrset(owner_name: "www.farsightsecurity.com")
api.summarize.rrset(owner_name: "*.farsightsecurity.com", rrtype: "ns", bailiwick: "farsightsecurity.com")
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
