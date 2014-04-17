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
#  words      :text
#

class Section < ActiveRecord::Base
  attr_accessible :number, :title, :chapter_id, :words
  
  validates :number,
    presence: true,
    uniqueness: { scope: :chapter_id }
  validates :chapter_id, presence: true
  
  belongs_to :chapter
end
