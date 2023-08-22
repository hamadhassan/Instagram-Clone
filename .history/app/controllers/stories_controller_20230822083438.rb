class StoriesController < ApplicationController
  before_action :authenticate_account!

  def index
    @stories = Story.where('expires_at >= ?', Time.now)
  end

  def new
    @story = current_account.stories.build
  end

  def create
    @story = current_account.stories.build(story_params)
    @story.expires_at = 1.mi.from_now

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
