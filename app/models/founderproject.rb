# == Schema Information
#
# Table name: founderprojects
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  founder_id :integer
#  project_id :integer
#
class Founderproject < ApplicationRecord
  belongs_to(:project, { :required => true, :class_name => "Project", :foreign_key => "project_id" })
  belongs_to(:founder, { :required => true, :class_name => "Founder", :foreign_key => "founder_id" })
end
