require 'spec_helper'

describe "/api/slides.json" do
  let!(:board) { FactoryGirl.create(:board) }
  let!(:second) { FactoryGirl.create(:slide, board: board, position: 2) }
  let!(:first) { FactoryGirl.create(:slide, board: board, position: 1) }
  let(:response) { get "/all_aboard/api/slides.json?ids[]=#{first.id}&ids[]=#{second.id}" }
  subject(:hash) { JSON.parse(response.body)["slides"] }

  it "returns a success response status" do
    expect(response.status).to eq(200)
  end

  it "returns all of the slides" do
    expect(hash.length).to eq(2)
    expect(hash.first["id"]).to eq(first.id)
    expect(hash.second["id"]).to eq(second.id)
  end
end
