class StoriesController < ApplicationController
  before_action :authenticate_account!
  def create
    @story = current_account.stories.build(story_params)
    @story.expires_at = 24.hours.from_now

    if @story.save
      redirect_to root_path, notice: 'Story created successfully.'
    else
      render :new
    end
  end
  private

  def story_params
    params.require(:story).permit(:image)
  end
  def destroy
    @story = current_user.stories.find(params[:id])
    @story.destroy
    redirect_to root_path, notice: 'Story deleted successfully.'
  end
end
