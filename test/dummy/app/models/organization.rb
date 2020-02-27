class Organization < ApplicationRecord
  TYPINGS = [:company, :department, :role]
  STATES = [:disabled, :enabled]

  enum typing: TYPINGS
  enum state: STATES

  validates_presence_of :typing, :state, :code
  validates :typing, inclusion: { in: self.typings.to_a.flatten }
  validates :state, inclusion:  { in: self.states.to_a.flatten }
  validates :uuid, presence: true, if: :company_type?

  def company_type?
    (self.typing == 'company')? true: false
  end
end
