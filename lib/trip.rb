 require 'csv'
 require 'time'

module RideShare
  class Trip
    attr_reader :id, :passenger, :driver, :start_time, :end_time, :cost, :rating

    def initialize(input)
      @id = input[:id]
      @driver = input[:driver]
      @passenger = input[:passenger]
      @start_time = input[:start_time]
      @end_time = input[:end_time]
      @cost = input[:cost]
      @rating = input[:rating]

      if @end_time != nil
        if @end_time < @start_time
          raise ArgumentError.new("End time cannot be before start time.")
        end
        if @rating > 5 || @rating < 1
          raise ArgumentError.new("Invalid rating #{@rating}")
        end
      end
    end # end of initialize

    def duration
      duration = (@end_time - @start_time)
    end


  end # end of class
end # end of module
