# Finds points that are included in a given circle
# Example call: checker.rb [[1,2],[60,56],[69,56]]
# Result: [[60, 56], [69, 56]]
module Checker

  require 'json'

  class Circle
    attr_reader :center, :radius

    def initialize(center, radius)
      @center, @radius = center, radius
    end

    def check(points)
      points_in_circle = points.select do |point|
        ((point.x - @center.x)**2 + (point.y - @center.y)**2) <= @radius**2
      end
      puts "Result: #{points_in_circle.map(&:to_s) }"
    rescue => exception
      puts "Error! #{exception.inspect}"
    end
  end

  class Point
    attr_accessor :x, :y

    def initialize(coordinates)
      @x, @y = coordinates
    end

    def to_s
       [@x, @y]
    end
  end

  def self.check
    center = Point.new([60.597223, 56.837992])
    radius = 10
    points = JSON.parse(ARGV.first).map{ |coordinates| Point.new(coordinates) }
    circle = Circle.new(center, radius)
    circle.check(points)
  rescue => exception
    puts "Error! #{exception.inspect}"
  end
end

Checker.check
