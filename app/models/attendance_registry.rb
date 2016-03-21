class AttendanceRegistry < ActiveRecord::Base
  belongs_to :section
  has_many :absentees, dependent: :destroy

  after_create :create_absentees
  after_update :update_absentees

  attr_accessor :absent_student_ids

private
  def create_absentees
    self.absent_student_ids.each do |absent_student_id|
      self.absentees.create(student_id: absent_student_id)
    end
  end

  def update_absentees
    self.absentees.reject do |absentee|
      self.absent_student_ids.include?(absentee.student_id)
    end.each do |absentee|
      absentee.destroy_all
    end
    self.absent_student_ids.each do |student_id|
        self.absentees.find_or_create_by(student_id: student_id)
    end
  end
end
