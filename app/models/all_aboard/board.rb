module AllAboard
  class Board < ActiveRecord::Base
    validates :name, presence: true
  end
end
