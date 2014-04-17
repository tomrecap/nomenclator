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

class Chapter < ActiveRecord::Base
  attr_accessible :number, :title, :prose_book_id
  
  validates :number,
    presence: true,
    uniqueness: { scope: :prose_book_id }
  validates :prose_book_id, presence: true
  
  belongs_to :prose_book
  has_many :sections
end
