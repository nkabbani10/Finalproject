# == Schema Information
#
# Table name: investors
#
#  id         :integer          not null, primary key
#  bio        :string
#  dob        :string
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Investor < ApplicationRecord
  has_many(:investorprojects, { :class_name => "Investorproject", :foreign_key => "investor_id", :dependent => :destroy })
  has_many(:projects, { :through => :investorprojects, :source => :project })
  mount_uploader :image, ImageUploader
end
