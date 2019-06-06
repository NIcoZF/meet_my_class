# frozen_string_literal: true

class KlassPolicy < ApplicationPolicy
  def following?
    record.students.include?(user)
  end

  class Scope < Scope
    def resolve
      scope.
        includes(:attendances).
        where(attendances: { student_id: user.id })
    end
  end
end
