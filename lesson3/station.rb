class Station
	attr_reader :name
	attr_accessor :trains

	def initialize(name)
		@name = name
		@trains = []
	end

	def receive_train(train)
		@trains.push(train)
	end

	def send_train(tr_num)
		@trains.each do |train|
			if train.number == tr_num then
				train.station += 1
				@trains.delete(train)
			end			
		end
	end

	def show_trains
	@trains.each {|train| puts train}
	end

	def show_trains_by_type (type='passenger')
	end
end