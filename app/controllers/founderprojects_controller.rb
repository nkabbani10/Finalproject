class FounderprojectsController < ApplicationController
  def index
    matching_founderprojects = Founderproject.all

    @list_of_founderprojects = matching_founderprojects.order({ :created_at => :desc })

    render({ :template => "founderprojects/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_founderprojects = Founderproject.where({ :id => the_id })

    @the_founderproject = matching_founderprojects.at(0)

    render({ :template => "founderprojects/show.html.erb" })
  end

  def create
    the_founderproject = Founderproject.new
    the_founderproject.project_id = params.fetch("query_project_id")
    the_founderproject.founder_id = params.fetch("query_founder_id")

    if the_founderproject.valid?
      the_founderproject.save
      redirect_to("/founderprojects", { :notice => "Founderproject created successfully." })
    else
      redirect_to("/founderprojects", { :alert => the_founderproject.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_founderproject = Founderproject.where({ :id => the_id }).at(0)

    the_founderproject.project_id = params.fetch("query_project_id")
    the_founderproject.founder_id = params.fetch("query_founder_id")

    if the_founderproject.valid?
      the_founderproject.save
      redirect_to("/founderprojects/#{the_founderproject.id}", { :notice => "Founderproject updated successfully."} )
    else
      redirect_to("/founderprojects/#{the_founderproject.id}", { :alert => the_founderproject.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_founderproject = Founderproject.where({ :id => the_id }).at(0)

    the_founderproject.destroy

    redirect_to("/founderprojects", { :notice => "Founderproject deleted successfully."} )
  end
end
