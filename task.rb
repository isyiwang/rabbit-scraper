require 'time'

SECONDS_IN_DAY = 86400

class Task
	attr_accessor :title, :time, :category, :min_price, :max_price, :avg_price

	def initialize(hash = {:title => "", :time => nil, :category => ""})
		@title = hash[:title]
		@time = hash[:time]
		@category = hash[:category]
		@min_price = 0
		@max_price = 0
		@avg_price = 0
	end

	def empty?
		@title.empty? && @time.empty? && @category.empty? && @min_price == 0 && @max_price == 0 && @avg_price = 0
	end

	def time_string=(time_s)
		@time = Time.parse(time_s)

		# Check for special 'X days ago' case
		begin
			split_time = time_s.split
			if split_time.length == 3 && split_time[1] == "days" && split_time[2] = "ago"
				offset_in_seconds = split_time[0].to_i * SECONDS_IN_DAY
				@time = Time.now - offset_in_seconds
			end
		rescue
		end
	end

	def to_s
		begin
			time_as_string = @time.strftime("%Y-%m-%d")
		rescue
		end

		"[#{@category}] #{@title} @ #{time_as_string} // $#{@min_price} - $#{@max_price} [Average price: $#{avg_price}]"
	end

end