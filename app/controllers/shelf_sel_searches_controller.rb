###
# Controller to destroy saved searches
###
class ShelfSelSearchesController < ApplicationController
  load_and_authorize_resource
  def delete_saved_search
    ShelfSelSearch.find([params[:user_name], params[:search_name]]).delete
    render body: nil
  end
end
