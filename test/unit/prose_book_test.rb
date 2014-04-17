# == Schema Information
#
# Table name: prose_books
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  number        :integer
#  prose_work_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ProseBookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
