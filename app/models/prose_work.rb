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

class ProseWork < ActiveRecord::Base
  attr_accessible :author_id, :title, :words
  
  validates :author_id, presence: true
  validates :title,
    presence: true,
    uniqueness: { scope: :author_id }
  
  belongs_to :author
  has_many :chapters,
    through: :prose_books,
    source: :chapters
  has_many :prose_books
  has_many :sections,
    through: :chapters,
    source: :sections
  
end
