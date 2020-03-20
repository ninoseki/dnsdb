# frozen_string_literal: true

RSpec.describe DNSDB do
  it "has a version number" do
    expect(DNSDB::VERSION).not_to be nil
  end
end
