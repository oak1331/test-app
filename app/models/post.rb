class Post < ApplicationRecord
  validates :memo, presence: true
end
