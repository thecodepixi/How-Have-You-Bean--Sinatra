class Coffee < ActiveRecord::Base 
  belongs_to :user
  validates :name,  presence: true
  validates :roaster,  presence: true
end 