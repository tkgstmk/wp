class Project < ApplicationRecord
  belongs_to :user
  
  attachment :image
end
