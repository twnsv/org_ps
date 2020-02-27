class SystemFunction < ApplicationRecord
  STATES = [:disabled, :enabled]

  enum state: STATES

  has_many :function_actions
  has_many :system_actions, through: :function_actions

  validates_presence_of :state, :code
  validates :state, inclusion: { in: self.states.to_a.flatten }
end
