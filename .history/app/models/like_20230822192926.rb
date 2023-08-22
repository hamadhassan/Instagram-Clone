# frozen_string_literal: true

# Represents the likes made by users on posts or other content in the application.
class Like < ApplicationRecord
  belongs_to :account
  belongs_to :post
end
