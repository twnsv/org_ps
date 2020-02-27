class FunctionAction < ApplicationRecord
  belongs_to system_function
  belongs_to system_action
end
