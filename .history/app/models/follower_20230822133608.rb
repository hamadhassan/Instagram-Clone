# frozen_string_literal: true

class Follower < ApplicationRecord
  # belongs_to :account
  validates_uniqueness_of :follower_id, scope: :following_id
  belongs_to :follower, class_name: 'Account'
  belongs_to :following, class_name: 'Account'
end
