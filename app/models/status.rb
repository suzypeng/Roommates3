# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Status < ApplicationRecord

  has_many :tasks, :dependent => :nullify
  
end
