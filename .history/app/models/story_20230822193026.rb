# frozen_string_literal: true

# Represents stories created by users in the application.
class Story < ApplicationRecord
  belongs_to :account
  has_one_attached :image
end
