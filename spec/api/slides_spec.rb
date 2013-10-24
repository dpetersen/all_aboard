require 'spec_helper'

describe "GET /api/slides.json" do
  let!(:second) { FactoryGirl.create(:slide, position: 2) }
  let!(:first) { FactoryGirl.create(:slide, position: 1) }
  let!(:assignment) { FactoryGirl.create(:perspective_assignment, slide: first) }
  let(:response) do
    get "/all_aboard/api/slides.json?ids[]=#{first.id}&ids[]=#{second.id}"
  end
  let(:hash) { JSON.parse(response.body) }
  subject { hash }

  it "returns a success response status" do
    expect(response.status).to eq(200)
  end

  describe "slides" do
    let(:slides) { hash["slides"] }

    it "returns all of the slides" do
      expect(slides.length).to eq(2)
      expect(slides.first["id"]).to eq(first.id)
      expect(slides.first["perspectiveAssignments"]).to eq([ assignment.id ])
      expect(slides.second["id"]).to eq(second.id)
      expect(slides.second["perspectiveAssignments"]).to be_empty
    end
  end

  describe "sideloaded PerspectiveAssignments" do
    let(:assignments) { hash["perspective_assignments"] }

    it "returns the expected PerspectiveAssignments" do
      expect(assignments.length).to eq(1)
      expect(assignments.first["id"]).to eq(assignment.id)
      expect(assignments.first["template"]).to eq(assignment.template_id)
    end
  end

  describe "sideloaded Templates" do
    let(:assignments) { hash["templates"] }

    it "returns the expected PerspectiveAssignments" do
      expect(assignments.length).to eq(1)
      expect(assignments.first["id"]).to eq(assignment.template_id)
    end
  end
end

describe "GET /api/slides/:id.json" do
  let!(:slide) { FactoryGirl.create(:slide) }
  let!(:assignment) { FactoryGirl.create(:perspective_assignment, slide: slide) }
  before { FactoryGirl.create(:perspective_assignment, slide: slide) }
  let(:response) { get "/all_aboard/api/slides/#{slide.id}.json" }
  subject(:hash) { JSON.parse(response.body) }

  describe "slides" do
    subject { hash["slide"] }
    its(["id"]) { should eq(slide.id) }
  end

  describe "sideloaded PerspectiveAssignments" do
    subject { hash["perspective_assignments"] }
    its(:length) { should eq(2) }
  end

  describe "sideloaded Templates" do
    let(:templates) { hash["templates"] }

    it "returns the expected Templates" do
      expect(templates.length).to eq(1)
      expect(templates.first["id"]).to eq(assignment.template_id)
    end
  end
end

describe "POST /api/slides.json" do
  let!(:board) { FactoryGirl.create(:board) }
  let(:response) do
    post("/all_aboard/api/slides.json", slide: { board: board.id, position: 19 })
  end

  it "returns a succcessful response code" do
    expect(response.status).to eq(201)
  end

  it "creates a Slide with the expected attributes" do
    response
    board.reload
    expect(board.slides.count).to eq(1)
    expect(board.slides.first.position).to eq(19)
  end
end
