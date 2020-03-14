# == Schema Information
#
# Table name: tasks
#
#  id               :integer          not null, primary key
#  body_description :string
#  task_name        :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status_id        :integer
#  user_id          :integer
#

class Task < ApplicationRecord

  belongs_to :user, :required => true
  belongs_to :status

  def userfortask
     return User.where({ :id => self.user_id }).at(0).username
 end

  def taskstatus
    return Task.where({ :id => self.status_id }).pluck(:status)
  end 

end
