require 'spec_helper'

describe "/api/sources.json" do
  let(:response) { get "/all_aboard/api/sources.json" }
  subject(:hash) { JSON.parse(response.body)["sources"] }

  it "returns a success response status" do
    expect(response.status).to eq(200)
  end

  it "returns the expected attributes" do
    expect(hash.length).to eq(1)
    expect(hash.first["id"]).to eq("TimeSource")
    expect(hash.first["name"]).to eq("Time")
  end
end
