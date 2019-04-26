class Phone < ApplicationRecord
  #Asssociations
  belongs_to :contact, optional: true
end
