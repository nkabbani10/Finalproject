# == Schema Information
#
# Table name: favourites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#  user_id    :integer
#
class Favourite < ApplicationRecord
  belongs_to(:project, { :required => true, :class_name => "Project", :foreign_key => "project_id" })
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
end
