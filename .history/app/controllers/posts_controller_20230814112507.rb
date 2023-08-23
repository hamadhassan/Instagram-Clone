class PostsController < ApplicationController
def show

end

private 

params.require(:user).permit(:email, :first_name, :last_name, {avatars: []})

end
