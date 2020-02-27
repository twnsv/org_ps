class SystemAction < ApplicationRecord
  STATES = [:disabled, :enabled]

  enum state: STATES

  has_many :function_actions

  validates_presence_of :state, :code
  validates :state, :unclusion(in: self.states.to_a.flatten)
end
