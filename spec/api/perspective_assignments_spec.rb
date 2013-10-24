require 'spec_helper'

describe "POST /api/perspective_assignments.json" do
  let(:slide) { FactoryGirl.create(:slide) }

  let!(:response) do
    post(
      "/all_aboard/api/perspective_assignments.json",
      perspective_assignment: {
        slide: slide.id,
        row: 1,
        column: 2,
        template: "template:id"
      }
    )
  end

  it "returns a success response status" do
    expect(response.status).to eq(201)
  end

  it "creates a PerspectiveAssignment with the expected attributes" do
    expect(AllAboard::PerspectiveAssignment.count).to eq(1)
    assignment = AllAboard::PerspectiveAssignment.first
    expect(assignment.slide).to eq(slide)
    expect(assignment.row).to eq(1)
    expect(assignment.column).to eq(2)
    expect(assignment.template_id).to eq("template:id")
  end
end

describe "PUT /api/perspective_assignments/:id.json" do
  let!(:assignment) { FactoryGirl.create(:perspective_assignment, row: 1) }
  let!(:response) do
    put(
      "/all_aboard/api/perspective_assignments/#{assignment.id}.json",
      perspective_assignment: { row: 19 }
    )
  end

  it "returns a success response status" do
    expect(response.status).to eq(204)
  end

  it "updates the expected PerspectiveAssignment" do
    expect(assignment.reload.row).to eq(19)
  end
end

describe "DELETE /api/perspective_assignments/:id.json" do
  let!(:assignment) { FactoryGirl.create(:perspective_assignment, row: 1) }
  let!(:response) do
    delete("/all_aboard/api/perspective_assignments/#{assignment.id}.json")
  end

  it "returns a success response status" do
    expect(response.status).to eq(204)
  end

  it "deletes the PerspectiveAssignment" do
    expect(AllAboard::PerspectiveAssignment.count).to be_zero
  end
end
