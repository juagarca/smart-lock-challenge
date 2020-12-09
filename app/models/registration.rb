class Registration < ApplicationRecord
  belongs_to :server
  belongs_to :lock
end
