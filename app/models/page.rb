class Page < ApplicationRecord
  validates :title,
  presence: true,
  length: {maximum: 15, minimum: 1}
end
