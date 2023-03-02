# == Schema Information
#
# Table name: investorprojects
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  investor_id :integer
#  project_id  :integer
#
class Investorproject < ApplicationRecord
  belongs_to(:project, { :required => true, :class_name => "Project", :foreign_key => "project_id" })
  belongs_to(:investor, { :required => true, :class_name => "Investor", :foreign_key => "investor_id" })
end
