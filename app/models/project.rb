# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  description :string
#  founded     :string
#  funding     :string
#  image       :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
  has_many(:founderprojects, { :class_name => "Founderproject", :foreign_key => "project_id", :dependent => :destroy })
  has_many(:investorprojects, { :class_name => "Investorproject", :foreign_key => "project_id", :dependent => :destroy })
  has_many(:favourites, { :class_name => "Favourite", :foreign_key => "project_id", :dependent => :destroy })
  has_many(:founders, { :through => :founderprojects, :source => :founder })
  has_many(:investors, { :through => :investorprojects, :source => :investor })
  mount_uploader :image, ImageUploader
end
