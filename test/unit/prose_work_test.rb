# == Schema Information
#
# Table name: prose_works
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  words      :text
#

require 'test_helper'

class ProseWorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
