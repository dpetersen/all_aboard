require 'spec_helper'

describe "/api/boards*" do
  describe "/api/boards.json" do
    subject(:hash) { JSON.parse(response.body)["boards"] }
    let(:response) { get "/all_aboard/api/boards.json" }

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

  describe "/api/boards/:id.json" do
    subject(:hash) { JSON.parse(response.body)["board"] }

    context "when no board exists" do
      let(:response) { get "/all_aboard/api/boards/nonexistant.json" }

      it "returns a 404 response status" do
        expect(response.status).to eq(404)
      end
    end

    context "when the board exists" do
      let(:board) { FactoryGirl.create(:board) }
      let(:response) { get "/all_aboard/api/boards/#{board.id}.json" }

      it "returns a success response status" do
        expect(response.status).to eq(200)
      end

      its(["id"]) { should eq(board.id) }
    end
  end
end
