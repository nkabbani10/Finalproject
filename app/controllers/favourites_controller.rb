class FavouritesController < ApplicationController
  def index
    matching_favourites = Favourite.all

    @list_of_favourites = matching_favourites.order({ :created_at => :desc })

    render({ :template => "favourites/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_favourites = Favourite.where({ :id => the_id })

    @the_favourite = matching_favourites.at(0)

    render({ :template => "favourites/show.html.erb" })
  end

  def create
    the_favourite = Favourite.new
    the_favourite.user_id = session.fetch(:user_id)
    the_favourite.project_id = params.fetch("query_project_id")

    if the_favourite.valid?
      the_favourite.save
      redirect_to("/favourites", { :notice => "Favourite created successfully." })
    else
      redirect_to("/favourites", { :alert => the_favourite.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_favourite = Favourite.where({ :id => the_id }).at(0)

    the_favourite.user_id = session.fetch(:user_id)
    the_favourite.project_id = params.fetch("query_project_id")

    if the_favourite.valid?
      the_favourite.save
      redirect_to("/favourites/#{the_favourite.id}", { :notice => "Favourite updated successfully."} )
    else
      redirect_to("/favourites/#{the_favourite.id}", { :alert => the_favourite.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_favourite = Favourite.where({ :id => the_id }).at(0)

    the_favourite.destroy

    redirect_to("/favourites", { :notice => "Favourite deleted successfully."} )
  end
end
