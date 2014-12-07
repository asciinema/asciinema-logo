#!/usr/bin/env ruby

require 'erb'

BIG_TRIANGLE_RADIUS = 500
SMALL_TRIANGLE_RADIUS = (2.0 / 5) * BIG_TRIANGLE_RADIUS # 2/5 of big radius
BIG_TRIANGLE_HEIGHT = (3 / 2.0) * BIG_TRIANGLE_RADIUS # h = 3/2 * r
HEIGHT = BIG_TRIANGLE_RADIUS * 3 / Math.sqrt(3) # a = r * 3 / sqrt(3)
WIDTH = HEIGHT # make it a square
COLOR = ARGV[0] || "#d40000"
BAR_WIDTH = 90

def rad(deg)
  deg * Math::PI / 180
end

def sin(deg)
  Math.sin(rad(deg))
end

def cos(deg)
  Math.cos(rad(deg))
end

def xy(radius, deg)
  [radius * cos(deg), radius * sin(deg)]
end

def center(x, y)
  dx = 1/2.0 * BIG_TRIANGLE_HEIGHT - 1/3.0 * BIG_TRIANGLE_HEIGHT
  [x - dx, y]
end

def to_svg_coords(x, y)
  [WIDTH / 2 + x, HEIGHT - (HEIGHT / 2 + y)]
end

def point(radius, deg)
  to_svg_coords(*center(*xy(radius, deg)))
end

def pt(radius, deg)
  point(radius, deg).join(" ")
end

erb = ERB.new(File.read('logo.erb.svg'))
puts erb.result(binding)
