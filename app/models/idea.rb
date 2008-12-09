class Idea < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :resources
    
    def get_participants
      result = []
      
      for user in users
        result << user
      end
      
      result 
    end
end
