require 'spec_helper'

describe "PUT /api/perspective_assignments/:id" do
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
