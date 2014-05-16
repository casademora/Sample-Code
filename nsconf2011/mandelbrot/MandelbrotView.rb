# MandelbrotView.rb
# mandelbrot
#
# Created by Saul Mora on 3/8/11.
# Copyright 2011 Magical Panda Software LLC. All rights reserved.

require 'rubygems'
require 'dispatch'

class MandelbrotView < NSView

    def awakeFromNib
        @max_iterations = 1000
        @scale = 1.4
    end

    def drawRect(rect)

        self.computeMandelbrotInRect(rect, atLocation:[-1,0], scale:@scale)

    end

    def computeMandelbrotAtPoint(point, center:center, inRect:bounds, iterations:iterations, scale:scale)

        xscaled = point[0]/(bounds.size.width/scale) + (center[0] - scale/2.0)
        yscaled = point[1]/(bounds.size.height/scale) + (center[1] - scale/2.0)

        x = xscaled
        y = yscaled

        (0..iterations).each { |i|
#            puts "x #{x} y #{y} -> iteration #{i}"
            return i if (x ** 2 + y ** 2) > 4

            xtemp = x ** 2 - y ** 2 + xscaled
            y = 2 * x * y + yscaled
            x = xtemp
        }
        iterations

    end

    def selectColor(value)
        colorValue = value / @max_iterations
        color = NSColor.colorWithCalibratedWhite(colorValue, alpha:1)
        color.set
    end

    def computeMandelbrotInRect(plane, atLocation:location, scale:scale)
        context = NSGraphicsContext.currentContext.graphicsPort

        startTime = Time.now
        puts "Starting draw #{startTime}"
        (location[1]..plane.size.height).each do |y|
            (location[0]..plane.size.width).each do |x|

                value = computeMandelbrotAtPoint([x, y], center:location, inRect:plane, iterations:@max_iterations, scale:@scale )

                selectColor value

                CGContextFillRect(context, [x,y,1,1])
            end
        end
        endTime = Time.now
        puts "Ended draw #{endTime}: took #{endTime - startTime} seconds"

    end

end
