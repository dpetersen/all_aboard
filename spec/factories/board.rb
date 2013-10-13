FactoryGirl.define do
  factory :board, class: AllAboard::Board do
    name "Test Board Name"
  end

  factory :slide, class: AllAboard::Slide do
    board
    position 1
  end

  factory :perspective_assignment, class: AllAboard::PerspectiveAssignment do
    slide
    template_id "time:current_time:2x1"
    column 3
    row 4
  end
end
