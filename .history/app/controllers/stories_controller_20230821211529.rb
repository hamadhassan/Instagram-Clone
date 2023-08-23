class StoriesController < ApplicationController
  before_action :authenticate_account!
end
