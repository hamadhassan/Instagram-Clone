# frozen_string_literal: true

# Helper methods for working with profile
module ProfileHelper
  def following?(account)
    current_account&.following&.include?(account)
  end
end
