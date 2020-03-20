# frozen_string_literal: true

RSpec.describe DNSDB::Clients::Summarize, :vcr do
  let(:api) { DNSDB::API.new }

  describe "#rdata" do
    it do
      res = api.summarize.rdata(rrtype: "ANY", value: "10.0.0.1", type: "ip")
      expect(res).to be_a(Hash)
    end

    it do
      res = api.summarize.rdata(value: "github.com", type: "name")
      expect(res).to be_a(Hash)
    end
  end

  describe "#rrset" do
    it do
      res = api.summarize.rrset(owner_name: "www.farsightsecurity.com")
      expect(res).to be_a(Hash)
    end

    it do
      res = api.summarize.rrset(owner_name: "*.farsightsecurity.com", rrtype: "ns", bailiwick: "farsightsecurity.com")
      expect(res).to be_a(Hash)
    end
  end
end
