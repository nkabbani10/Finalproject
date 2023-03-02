class InvestorprojectsController < ApplicationController
  def index
    matching_investorprojects = Investorproject.all

    @list_of_investorprojects = matching_investorprojects.order({ :created_at => :desc })

    render({ :template => "investorprojects/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_investorprojects = Investorproject.where({ :id => the_id })

    @the_investorproject = matching_investorprojects.at(0)

    render({ :template => "investorprojects/show.html.erb" })
  end

  def create
    the_investorproject = Investorproject.new
    the_investorproject.investor_id = params.fetch("query_investor_id")
    the_investorproject.project_id = params.fetch("query_project_id")

    if the_investorproject.valid?
      the_investorproject.save
      redirect_to("/investorprojects", { :notice => "Investorproject created successfully." })
    else
      redirect_to("/investorprojects", { :alert => the_investorproject.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_investorproject = Investorproject.where({ :id => the_id }).at(0)

    the_investorproject.investor_id = params.fetch("query_investor_id")
    the_investorproject.project_id = params.fetch("query_project_id")

    if the_investorproject.valid?
      the_investorproject.save
      redirect_to("/investorprojects/#{the_investorproject.id}", { :notice => "Investorproject updated successfully."} )
    else
      redirect_to("/investorprojects/#{the_investorproject.id}", { :alert => the_investorproject.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_investorproject = Investorproject.where({ :id => the_id }).at(0)

    the_investorproject.destroy

    redirect_to("/investorprojects", { :notice => "Investorproject deleted successfully."} )
  end
end
