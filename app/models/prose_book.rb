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
#  words         :text
#

class ProseBook < ActiveRecord::Base
  attr_accessible :number, :prose_work_id, :title, :words
  
  validates :number,
    presence: true,
    uniqueness: { scope: :prose_work_id }
  validates :prose_work_id, presence: true
  
  has_many :chapters
  belongs_to :prose_work
  has_many :sections,
    through: :chapters,
    source: :sections
  
end
