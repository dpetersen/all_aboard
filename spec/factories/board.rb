FactoryGirl.define do
  factory :board, class: AllAboard::Board do
    name "Test Board Name"
  end

  factory :slide, class: AllAboard::Slide do
    board
    position 1
  end
end
