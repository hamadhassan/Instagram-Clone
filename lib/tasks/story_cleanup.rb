# frozen_string_literal: true

task delete_expired_stories: :environment do
  Story.where('expires_at <= ?', Time.now).destroy_all
end
