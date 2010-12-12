# SudokuPuzzleWindowController.rb
# SudokuSolverRB
#
# Created by Saul Mora on 12/6/10.
# Copyright 2010 Magical Panda Software LLC. All rights reserved.
require 'rubygems'
require 'pp'

class SudokuPuzzleWindowController < NSWindowController

    attr_accessor :cell_0_0, :cell_0_1, :cell_0_2, :cell_0_3, :cell_0_4, :cell_0_5, :cell_0_6, :cell_0_7, :cell_0_8
    attr_accessor :cell_1_0, :cell_1_1, :cell_1_2, :cell_1_3, :cell_1_4, :cell_1_5, :cell_1_6, :cell_1_7, :cell_1_8
    attr_accessor :cell_2_0, :cell_2_1, :cell_2_2, :cell_2_3, :cell_2_4, :cell_2_5, :cell_2_6, :cell_2_7, :cell_2_8
    attr_accessor :cell_3_0, :cell_3_1, :cell_3_2, :cell_3_3, :cell_3_4, :cell_3_5, :cell_3_6, :cell_3_7, :cell_3_8
    attr_accessor :cell_4_0, :cell_4_1, :cell_4_2, :cell_4_3, :cell_4_4, :cell_4_5, :cell_4_6, :cell_4_7, :cell_4_8
    attr_accessor :cell_5_0, :cell_5_1, :cell_5_2, :cell_5_3, :cell_5_4, :cell_5_5, :cell_5_6, :cell_5_7, :cell_5_8
    attr_accessor :cell_6_0, :cell_6_1, :cell_6_2, :cell_6_3, :cell_6_4, :cell_6_5, :cell_6_6, :cell_6_7, :cell_6_8
    attr_accessor :cell_7_0, :cell_7_1, :cell_7_2, :cell_7_3, :cell_7_4, :cell_7_5, :cell_7_6, :cell_7_7, :cell_7_8 
    attr_accessor :cell_8_0, :cell_8_1, :cell_8_2, :cell_8_3, :cell_8_4, :cell_8_5, :cell_8_6, :cell_8_7, :cell_8_8 
    
    def puzzle
        cells = []
        0.upto(8) do |x|
            row = []
            0.upto(8) do |y|
                row << self.valueForKeyPath("cell_#{x}_#{y}.intValue")
            end
            cells << row
        end
        @puzzle = cells
    end

    def next_state(state, x, y)
        $count = $count + 1
        y = 0 and x = x + 1 if y == 9
        return true if x == 9

        unless state[x][y].zero?
            return false unless valid_cell?(state, x, y)
            return next_state(state, x, y + 1)
        else
            1.upto(9) do |i|
                state[x][y] = i
                self.setValue i, :forKeyPath => "cell_#{x}_#{y}.intValue"
                return true if valid_cell?(state, x, y) and next_state(state, x, y + 1)
            end
        end

        state[x][y] = 0
        false
    end
    
    def valid_cell?(state, x, y)
      # check in col and row
      0.upto(8) do |i|
        return false if i != y and state[x][i] == state[x][y]
        return false if i != x and state[i][y] == state[x][y]
      end

      # check in box
      x_from = (x / 3) * 3
      y_from = (y / 3) * 3
      x_from.upto(x_from + 2) do |xx|
        y_from.upto(y_from + 2) do |yy|
          return false if (xx != x or yy != y) and state[xx][yy] == state[x][y]
        end
      end

      true
    end
    
    def solve(sender)
        pp puzzle
        $count = 0
        next_state(@puzzle, 0, 0) 
        pp "Solved in #{$count} steps"
        pp puzzle
    end

    def reset(sender)
        @puzzle = []
        0.upto(8) do |x|
            0.upto(8) do |y|
                self.setValue 0, :forKeyPath => "cell_#{x}_#{y}.intValue"
            end
        end
    end
end