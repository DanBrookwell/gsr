class Experience < ActiveRecord::Base
	validates :details, :presence => true
  	belongs_to :guest

  	def self.search_experiences(query)
	    where("id like ?", "%#{query}%") 
	end
end
