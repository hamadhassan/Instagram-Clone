class Post < ApplicationRecord
  it { should belong_to(:object) } 
  scope active, -> { where(:active => true)}
end
