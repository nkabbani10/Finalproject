class InvestorsController < ApplicationController
  def index
    matching_investors = Investor.all

    @list_of_investors = matching_investors.order({ :created_at => :desc })

    render({ :template => "investors/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_investors = Investor.where({ :id => the_id })

    @the_investor = matching_investors.at(0)

    render({ :template => "investors/show.html.erb" })
  end

  def create
    the_investor = Investor.new
    the_investor.name = params.fetch("query_name")
    the_investor.dob = params.fetch("query_dob")
    the_investor.bio = params.fetch("query_bio")
    the_investor.image = params.fetch("query_image")

    if the_investor.valid?
      the_investor.save
      redirect_to("/investors", { :notice => "Investor created successfully." })
    else
      redirect_to("/investors", { :alert => the_investor.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_investor = Investor.where({ :id => the_id }).at(0)

    the_investor.name = params.fetch("query_name")
    the_investor.dob = params.fetch("query_dob")
    the_investor.bio = params.fetch("query_bio")
    the_investor.image = params.fetch("query_image")

    if the_investor.valid?
      the_investor.save
      redirect_to("/investors/#{the_investor.id}", { :notice => "Investor updated successfully."} )
    else
      redirect_to("/investors/#{the_investor.id}", { :alert => the_investor.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_investor = Investor.where({ :id => the_id }).at(0)

    the_investor.destroy

    redirect_to("/investors", { :notice => "Investor deleted successfully."} )
  end
end
