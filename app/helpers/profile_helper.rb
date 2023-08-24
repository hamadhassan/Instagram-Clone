module ProfileHelper
  def following?(account)
    current_account&.following&.include?(account)
  end
end
