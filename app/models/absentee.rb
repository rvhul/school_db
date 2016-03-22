# == Schema Information
#
# Table name: absentees
#
#  id                     :integer          not null, primary key
#  student_id             :integer
#  attendance_registry_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'messenger_service'

class Absentee < ActiveRecord::Base
  belongs_to :student
  belongs_to :attendance_registry

  after_create :send_absent_notification!
  after_destroy :send_present_notification!

private
  def send_absent_notification!
    student = self.student
    msg = ""
    msg += "Dear #{student.fathers_name}, "
    msg += "Your child, #{student.name}, was not present today during attendance"
    msg += "This is to inform you of his/her absence."
    msg += "Regards, CodeTillYouErode Bootcamp"
    MessengerService.new.send_sms("(847) 961-4257", self.student.phone, msg)
  end

  def send_present_notification!
    student = self.student
    msg = ""
    msg += "Dear #{student.fathers_name}, "
    msg += "Your child, #{student.name}, is present at school now"
    msg += "Regards, CodeTillYouErode Bootcamp"
    MessengerService.new.send_sms("(847) 961-4257", self.student.phone, msg)
  end
end
