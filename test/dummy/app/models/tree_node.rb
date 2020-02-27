class TreeNode < ApplicationRecord
  STATES = [:disabled, :enabled]

  enum state: STATES

  belongs_to :nodeable, polymorphic: true

  has_closure_tree

  validates_presence_of :code, :state
  validates :state, inclusion: { in: self.states.to_a.flatten }
end
