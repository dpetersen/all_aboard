require 'spec_helper'

describe "/api/boards.json" do
  let(:response) { get "/all_aboard/api/boards.json" }
  subject(:hash) { JSON.parse(response.body)["boards"] }

  context "with no boards" do
    it "returns a success response status" do
      expect(response.status).to eq(200)
    end

    it { should be_empty }
  end

  context "with boards" do
    let!(:board) { FactoryGirl.create(:board, name: "Test Board") }

    it "returns a success response status" do
      expect(response.status).to eq(200)
    end

    it "returns all of the boards" do
      expect(hash.length).to eq(1)
      expect(hash.first["id"]).to eq(board.id)
      expect(hash.first["name"]).to eq("Test Board")
    end
  end
end
