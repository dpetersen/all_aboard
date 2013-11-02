require 'spec_helper'

describe "/api/sources*" do
  describe "/api/sources.json" do
    let(:response) { get "/all_aboard/api/sources.json" }
    let(:hash) { JSON.parse(response.body) }

    it "returns a success response status" do
      expect(response.status).to eq(200)
    end

    describe "the sources" do
      subject(:sources) { hash["sources"] }

      it "returns the expected sources" do
        expect(sources.length).to eq(1)
        expect(sources.first["id"]).to eq("time")
        expect(sources.first["configurable_attribute_ids"]).to eq([ "time:timezone" ])
      end
    end

    describe "sideloaded configurable_attributes" do
      subject(:attributes) { hash["configurable_attributes"] }

      it "returns the expected configurable attributes" do
        expect(attributes.length).to eq(1)
        expect(attributes.first["id"]).to eq("time:timezone")
      end
    end

    describe "sideloaded perspectives" do
      subject(:attributes) { hash["perspectives"] }

      it "returns the expected perspectives" do
        expect(attributes.length).to eq(1)
        expect(attributes.first["id"]).to eq("time:current_time")
      end
    end

    describe "sideloaded templates" do
      subject(:attributes) { hash["templates"] }

      it "returns the expected templates" do
        expect(attributes.length).to eq(2)
        expect(attributes.first["id"]).to eq("time:current_time:2x1")
        expect(attributes.second["id"]).to eq("time:current_time:4x4")
      end
    end
  end

  describe "/api/sources/:id.json" do
    let(:response) { get "/all_aboard/api/sources/time.json" }
    let(:hash) { JSON.parse(response.body) }

    it "returns a success response status" do
      expect(response.status).to eq(200)
    end

    describe "the sources" do
      subject(:source) { hash["source"] }

      it "returns the expected source" do
        expect(source["id"]).to eq("time")
        expect(source["configurable_attribute_ids"]).to eq([ "time:timezone" ])
      end
    end

    describe "sideloaded configurable_attributes" do
      subject(:attributes) { hash["configurable_attributes"] }

      it "returns the expected configurable attributes" do
        expect(attributes.length).to eq(1)
        expect(attributes.first["id"]).to eq("time:timezone")
      end
    end

    describe "sideloaded perspectives" do
      subject(:attributes) { hash["perspectives"] }

      it "returns the expected perspectives" do
        expect(attributes.length).to eq(1)
        expect(attributes.first["id"]).to eq("time:current_time")
      end
    end

    describe "sideloaded templates" do
      subject(:attributes) { hash["templates"] }

      it "returns the expected templates" do
        expect(attributes.length).to eq(2)
        expect(attributes.first["id"]).to eq("time:current_time:2x1")
        expect(attributes.second["id"]).to eq("time:current_time:4x4")
      end
    end
  end
end
