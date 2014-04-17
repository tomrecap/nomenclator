# == Schema Information
#
# Table name: chapters
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  number        :integer
#  prose_book_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  words         :text
#

require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
