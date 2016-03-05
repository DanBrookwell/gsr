class Guest < ActiveRecord::Base
	has_many :experiences

	# It returns the guests whose emails contain one or more words that form the query
	  def self.search_first_name(query)
	    # where(:email, query) -> This would return an exact match of the query
	    where("first_name like ?", "%#{query}%") 
	  end

	  def self.search_last_name(query)
	    # where(:email, query) -> This would return an exact match of the query
	    where("last_name like ?", "%#{query}%") 
	  end

	  def self.search_email(query)
	    # where(:email, query) -> This would return an exact match of the query
	    where("email like ?", "%#{query}%") 
	  end

	  def self.search_phone(query)
	    # where(:email, query) -> This would return an exact match of the query
	    where("phone like ?", "%#{query}%") 
	  end

	  def self.search_id(query)
	    # where(:email, query) -> This would return an exact match of the query
	    where("id like ?", "%#{query}%") 
	  end
end
