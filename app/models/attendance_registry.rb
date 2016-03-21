class AttendanceRegistry < ActiveRecord::Base
  belongs_to :section
  has_many :absentees
  after_create :create_absentees

  attr_accessor :absentee_ids

private
  def create_absentees
    self.absentee_ids.each do |absentee_id|
      self.absentees.create(student_id: absentee_id)
    end
  end
end
