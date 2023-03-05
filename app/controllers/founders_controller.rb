class FoundersController < ApplicationController
  def index
    matching_founders = Founder.all

    @list_of_founders = matching_founders.order({ :created_at => :desc })

    render({ :template => "founders/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_founders = Founder.where({ :id => the_id })

    @the_founder = matching_founders.at(0)

    render({ :template => "founders/show.html.erb" })
  end

  def create
    the_founder = Founder.new
    the_founder.name = params.fetch("query_name")
    the_founder.dob = params.fetch("query_dob")
    the_founder.bio = params.fetch("query_bio")
    the_founder.image = params.fetch(:image)

    if the_founder.valid?
      the_founder.save
      redirect_to("/founders", { :notice => "Founder created successfully." })
    else
      redirect_to("/founders", { :alert => the_founder.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_founder = Founder.where({ :id => the_id }).at(0)

    the_founder.name = params.fetch("query_name")
    the_founder.dob = params.fetch("query_dob")
    the_founder.bio = params.fetch("query_bio")
    the_founder.image = params.fetch(:image)

    if the_founder.valid?
      the_founder.save
      redirect_to("/founders/#{the_founder.id}", { :notice => "Founder updated successfully."} )
    else
      redirect_to("/founders/#{the_founder.id}", { :alert => the_founder.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_founder = Founder.where({ :id => the_id }).at(0)

    the_founder.destroy

    redirect_to("/founders", { :notice => "Founder deleted successfully."} )
  end
end
