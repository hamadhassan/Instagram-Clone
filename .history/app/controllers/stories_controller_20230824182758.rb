# frozen_string_literal: true

# This controller handles the stoires functionality in the application.
class StoriesController < ApplicationController
  before_action :authenticate_account!

  def index
    @stories = Story.where('expires_at >= ?', Time.now).where.not(account_id: current_account.id) unless account_signed_in?
    @current_account_stoires=Story.where(account_id: current_account.id) if account_signed_in?
  end

  def new
    @story = current_account.stories.build
  end

  def create
    @story = current_account.stories.build(story_params)
    @story.expires_at = 24.hours.from_now

    if @story.save
      redirect_to root_path, notice: 'Story created successfully.'
    else
      render :new
    end
  end

  def destroy
    @story = current_account.stories.find(params[:id])
    @story.destroy
    redirect_back(fallback_location: story_path(@story))
  end

  private

  def story_params
    params.require(:story).permit(:image)
  end
end
