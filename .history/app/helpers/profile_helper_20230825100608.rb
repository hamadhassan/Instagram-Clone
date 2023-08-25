
# frozen_string_literal: true
# Helper methods for working with likes
module ProfileHelper
  def following?(account)
    current_account&.following&.include?(account)
  end
end
