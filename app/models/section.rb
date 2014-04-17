# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  number     :integer
#  chapter_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Section < ActiveRecord::Base
  attr_accessible :number, :title, :chapter_id
  
  validates :number,
    presence: true,
    uniqueness: { scope: :chapter_id }
  validates :chapter_id, presence: true
  
  belongs_to :chapter
end
