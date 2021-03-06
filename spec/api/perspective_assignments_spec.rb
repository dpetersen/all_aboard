require 'spec_helper'

describe "POST /api/perspective_assignments.json" do
  let(:slide) { FactoryGirl.create(:slide) }

  let!(:response) do
    post(
      "/all_aboard/api/perspective_assignments.json",
      perspective_assignment: {
        slide_id: slide.id,
        row: 1,
        column: 2,
        template_id: "time:current_time:2x1"
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
    expect(assignment.template_id).to eq("time:current_time:2x1")
  end

  it "responds with the associated payload" do
    assignment = AllAboard::PerspectiveAssignment.first
    h = JSON.parse(response.body)
    expect(h["perspective_assignment"]["payload_id"]).to eq(assignment.data_key)
    expect(h["payloads"].length).to eq(1)
    expect(h["payloads"].first["id"]).to eq(assignment.data_key)
    expect(h["payloads"].first["value"]).to be_empty
  end

  it "responds with the associated configurable attributes" do
    assignment = AllAboard::PerspectiveAssignment.first
    attribute_id = "time:current_time:#{assignment.id}:format"
    h = JSON.parse(response.body)
    expect(h["perspective_assignment"]["configurable_attribute_ids"]).to eq(
      [ attribute_id ]
    )
    expect(h["configurable_attributes"].length).to eq(1)
    expect(h["configurable_attributes"].first["id"]).to eq(attribute_id)
  end

  it "queues jobs that are associated with the assignment" do
    assignment = AllAboard::PerspectiveAssignment.first
    expect(TimeSource::UpdateTimeJob).to have_queued(assignment.id)
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

  # As far as I remember, this action is only called when you move an
  # assignment around.  That doesn't change the data.
  it "does not queue jobs that are associated with the assignment" do
    expect(TimeSource::UpdateTimeJob).to_not have_queued(assignment.id)
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
