class Route
	attr_reader :first, :last
	attr_accessor :stations

	def initialize(first, last)
		@first = first
		@last = last
		@stations = [first, last]
	end

	def add_station(name)
		@stations.insert(-2, name)
	end

	def remove_station(name)
		@stations.delete(name) if !(name == first || name == last)
	end
	def show
		@stations.each {|station| puts station}
	end
end