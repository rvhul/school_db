# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  student_id :integer
#  english    :string
#  integer    :string
#  hindi      :integer
#  math       :integer
#  science    :integer
#  social     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
