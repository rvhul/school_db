class Absentee < ActiveRecord::Base
  belongs_to :student
  belongs_to :attendance_registry

  after_create :send_absent_notification!
  after_destroy :send_present_notification!

private
  def send_absent_notification!
    puts ">>>>>> send sms to #{self.student.phone}"
  end

  def send_present_notification!
    puts ">>>>>send present sms to #{self.student.phone}"
  end
end
