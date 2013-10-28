require 'spec_helper'

describe "GET /api/updates.json?board_id=:board_id" do
  let!(:board) { FactoryGirl.create(:board) }
  let!(:slide) { FactoryGirl.create(:slide, board: board) }
  let!(:assignment) { FactoryGirl.create(:perspective_assignment, slide: slide) }
  before { assignment.update_data(key: "value") }

  subject(:response) { get all_aboard.api_updates_path(board_id: board.id, format: :json) }

  its(:status) { should eq(200) }

  describe "the returned payloads" do
    subject(:payloads) { JSON.parse(response.body)["payloads"] }
    its(:length) { should eq(1) }

    it "returns the latest data" do
      expect(payloads.first["id"]).to eq(assignment.data_key)
      expect(payloads.first["value"]).to eq("key" => "value")
    end
  end
end
