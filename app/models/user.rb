class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :password
  validates_presence_of :email
  
  validates_uniqueness_of :name
  
  validates_confirmation_of :password

  has_and_belongs_to_many :ideas
  belongs_to :profile
  
end
