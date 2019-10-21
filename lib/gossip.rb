require 'pry'
require 'csv'

class Gossip
	attr_accessor :author, :content, :id
	@@gossip_count = 0

	def initialize(author, content)
		@author = author
		@content = content
		@id = @@gossip_count
		@@gossip_count = @@gossip_count + 1
		
	end

	def save
	  CSV.open("./db/gossip.csv", "ab") do |csv|  
      csv << [@author, @content] end
    
	end

	def self.all
  		all_gossips = []
  		CSV.read("./db/gossip.csv").each do |csv_line|
   		 all_gossips << Gossip.new(csv_line[0], csv_line[1])
 		 end
  	return all_gossips
	end

  def self.find(id)

    return self.all[id.to_i]

  end

  def update(id)

  	all_gossips[id.to_i] == Gossip.new(@author,@content).save

  end



end