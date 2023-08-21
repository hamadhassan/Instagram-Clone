class StoriesController < ApplicationController
  before_action :authenticate_user!
end
