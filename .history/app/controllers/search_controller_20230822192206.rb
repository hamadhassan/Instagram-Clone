# frozen_string_literal: true
# This controller handles the search functionality in the application.

class SearchController < ApplicationController
  def index
    @results = if params[:query].present?
                 Account.search_by_username_and_email(params[:query])
               else
                 []
               end
  end
end
