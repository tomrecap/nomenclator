# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true
  
  has_many :chapters,
    through: :prose_books,
    source: :chapters
  has_many :prose_books,
    through: :prose_works,
    source: :prose_books
  has_many :prose_works
  has_many :sections,
    through: :chapters,
    source: :sections

end
