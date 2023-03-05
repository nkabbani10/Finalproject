# == Schema Information
#
# Table name: founders
#
#  id         :integer          not null, primary key
#  bio        :string
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Founder < ApplicationRecord
  has_many(:founderprojects, { :class_name => "Founderproject", :foreign_key => "founder_id", :dependent => :destroy })
  has_many(:projects, { :through => :founderprojects, :source => :project })
  mount_uploader :image, ImageUploader
end
