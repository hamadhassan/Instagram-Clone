class Comment < ApplicationRecord
  it { should belong_to(:object) } 
end
