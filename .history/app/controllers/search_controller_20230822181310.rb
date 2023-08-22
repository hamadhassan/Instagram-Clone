class SearchController < ApplicationController
  def index
    if params[:query].present?
      @results = Account.search_by_username_and_email(params[:query])
    else
      @results = []
    end
  end
end
