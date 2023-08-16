class Post < ApplicationRecord
  belongs_to :account
  scope active, -> { where active => true}
  before
  private
  def set_active
    self.active=true
  end
end
