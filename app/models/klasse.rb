# == Schema Information
#
# Table name: klasses
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  teacher_id  :bigint
#
# Indexes
#
#  index_klasses_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (teacher_id => teachers.id)
#

class Klasse < ApplicationRecord
  belongs_to :teacher

  has_many :participations, dependent: :drestroy
  has_many :students, through: :participations

  has_many :progressions, dependent: :destroy
  has_many :students,through: :progressions

end