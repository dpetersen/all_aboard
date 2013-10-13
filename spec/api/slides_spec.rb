require 'spec_helper'

describe "/api/slides/*" do
  describe "/api/slides.json" do
    let!(:second) { FactoryGirl.create(:slide, position: 2) }
    let!(:first) { FactoryGirl.create(:slide, position: 1) }
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

  describe "/api/slides/:id.json" do
    let!(:slide) { FactoryGirl.create(:slide) }
    let(:response) { get "/all_aboard/api/slides/#{slide.id}.json" }
    subject(:hash) { JSON.parse(response.body)["slide"] }

    its(["id"]) { should eq(slide.id) }
  end
end
