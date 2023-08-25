# frozen_string_literal: true

# Represents posts created by users in the application.
class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'Account'
  belongs_to :following, class_name: 'Account'
end
