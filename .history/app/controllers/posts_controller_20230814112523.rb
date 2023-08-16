class PostsController < ApplicationController
def show

end

private 
def s
params.require(:user).permit(:email, :first_name, :last_name, {avatars: []})

end
