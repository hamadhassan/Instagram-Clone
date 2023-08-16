class PostsController < ApplicationController
def show

end

private

def post_parms
  params.require(:post).permit(:image, :first_name, :last_name, {avatars: []})
end

end
