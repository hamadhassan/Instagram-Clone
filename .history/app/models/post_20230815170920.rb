class Post < ApplicationRecord
  belongs_to :account
  before_create: set_active
  
  scope active, -> { where active => true}
  private
  def set_active
    self.active=true
  end
end
