# frozen_string_literal: true

RSpec.describe DNSDB::Clients::Lookup, :vcr do
  let(:api) { DNSDB::API.new }

  describe "#rdata" do
    it do
      res = api.lookup.rdata(value: "10.0.0.1", type: "ip")
      expect(res).to be_an(Array)
    end

    it do
      res = api.lookup.rdata(value: "github.com", type: "name")
      expect(res).to be_an(Array)
    end

    it do
      res = api.lookup.rdata(value: "154.9.205.199", type: "ip", rrtype: "A")
      expect(res).to be_an(Array)
    end
  end

  describe "#rrset" do
    it do
      res = api.lookup.rrset(owner_name: "www.farsightsecurity.com")
      expect(res).to be_an(Array)
    end

    it do
      res = api.lookup.rrset(owner_name: "*.farsightsecurity.com", rrtype: "ns", bailiwick: "farsightsecurity.com")
      expect(res).to be_an(Array)
    end

    it do
      res = api.lookup.rrset(owner_name: "*.farsightsecurity.com", rrtype: "ns", bailiwick: "farsightsecurity.com", limit: 100, time_last_after: 1_468_281_600)
      expect(res).to be_an(Array)
    end
  end
end
