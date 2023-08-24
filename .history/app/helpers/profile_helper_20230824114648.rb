module ProfileHelper
  def following?(account)
    current_account&.following&.include
  end
end
