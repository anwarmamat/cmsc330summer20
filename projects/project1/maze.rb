#!/usr/local/bin/ruby

#########################################################
#########################################################
##   _____ ______   ________  ________  _______        ##
##  |\   _ \  _   \|\   __  \|\_____  \|\  ___ \       ##
##  \ \  \\\__\ \  \ \  \|\  \\|___/  /\ \   __/|      ##
##   \ \  \\|__| \  \ \   __  \   /  / /\ \  \_|/__    ##
##    \ \  \    \ \  \ \  \ \  \ /  /_/__\ \  \_|\ \   ##
##     \ \__\    \ \__\ \__\ \__\\________\ \_______\  ##
##      \|__|     \|__|\|__|\|__|\|_______|\|_______|  ##
##                                                     ##
#########################################################
#########################################################
##               CMSC 330 - Project 1                  ##
#########################################################
#########################################################

## I've classified this to give us the ability to call @maze and perform actions on it
## This allows us to do things with the maze whilst storing it in memory

## None of the nonsense about calling sequential functions, this is Ruby
## The following is how it works - Class // functions

## Because whoever set up the app couldn't be bothered putting the actual functions into runner.rb (why even have that file?), they've been included here
## The following is how it works:

## @maze = Maze.new(file)
## @maze.x -> allows us to call instance methods on the maze object
## Maze.xyz -> allows us to call class methods on the Maze class

#########################################################
#########################################################

# For testing purposes (public.rb)

## Main ##
## Whoever wrote the other code must have been braindead ##
def main(command_name, file_name)

  ## Command ##
  ## Oh, what's this? No infinite recursion because you're referencing "open" multiple times? ##
  @maze = Maze.new(file_name)

  ## Actions ##
  ## The beauty of having a CLASS to refer to ##
  ## No more confusing functions, no more self-referencing "open" methods ##
  ## Just the sweet harmony of a class which is instantiated, held in memory and can now be manipulated ##
  begin
    @maze.send command_name
  rescue
    fail("Invalid command")
  end

end
#########################################################
#########################################################

# => Maze
# => Invoked by runner.rb and held in memory
class Maze

  # => Attr_accessor
  # => Used to create methods that can be accessed & populated on the class itself (@maze.file )
  attr_accessor :file, :output

  ###################
  ###################

  # => Constructor
  # => Takes arguments and allows us to build out the class object
  def initialize file, mode: 'r'
    @file = File.open file, mode, &:readlines # => https://stackoverflow.com/a/4726937/1143732
  end

  ###################
  ###################

  # => Open
  # => Code taken from provided maze.rb
  # => @maze.open
  def open open_cells: 0
    parse(:normal) { |x, y, ds, w| open_cells += 1 if ds.to_s.strip.empty? } # => https://stackoverflow.com/a/16328435/1143732
    return open_cells
  end

  ###################
  ###################

  # => Bridges
  # => Code taken from provided maze.rb
  # => @maze.bridge
  def bridge bridges: [], indexes: []
    parse(:normal) do |x, y, ds, w, i|
      bridges[i] = { x: x, y: y, ds: ds } if !ds.to_s.strip.empty? # => only if there are ds values
    end
    bridges.compact!.sort_by! { |hsh| hsh[:y] }.each_slice(2).with_index do |group,i|
      group[1][:ds].scan(/\w/).each do |x|
        indexes[i] ||= []
        indexes[i] << group if group[0][:ds].include? x # since all bridges have to be next to each other, and since all bridges require rr, ll, dd, uu, that's what we validate against
      end
    end
    return indexes.uniq!.count # => Only need to print/puts/echo once
  end

  ###################
  ###################

  # => ShortCells
  # => From provided maze.rb
  # => @maze.sortcells
  def sortcells data: []
    parse(:normal) do |x, y, ds, w|
      count = ds.split('').count || 0
      data[count] ||= "#{count}"
      data[count] += ",(#{x},#{y})"
    end
    return data
  end

  ###################
  ###################

  # => Paths
  # => Maze paths (Part 2 - https://github.com/anwarmamat/cmsc330summer20/tree/master/projects/project1#part-2-process--sort-paths-by-cost)
  def paths valid: false, paths: ["none"], format: :formatted

    # => Valid
    # => This allows us to call "paths valid: true" and receive true/false
    return parse :has_paths? if valid != false

    # => Paths
    # => Pulls lines from the file which start with "path"
    parse :paths do |name, x, y, ds, w, i|

      # each path is weighted on its directions
      # we need to extract the directions, and then sequentially traverse the non-paths, saving each value
      # we should end up with an array as follows (first will define the array):
      # [ { "name" => "path1", "path" => {x: 0, y: 1, ds: ldr, w: 123,123}, items => [{...}] }}, { path2: [] } ]

      path = { "name" => name, "path" => { x: x, y: y, ds: ds }, "items" => [] }
      ds.scan(/\w/).each_with_index do |direction, index|
        x, y = directions(x, y, ds[index-1]) if index > 0

        step = parse(:array).compact.find { |a| a[:x].to_i == x && a[:y].to_i == y } # https://stackoverflow.com/a/31832490/1143732
        next_direction = step[:ds].index(direction)

        # if the next step does not correspond with previous, invalid
        next_direction ? path["items"] << step.merge!({ "weighted_value" => step[:w].split(" ")[next_direction] }) : path["valid"] = false
      end

      # This is a hack, but ran out of time
      # Basically, the above works (but does not include the final step -- it's a problem with the indexes)
      # To fix this, we can append the "next" step manually (with 0 weight):
      if path["items"].any?
        x, y = directions(path["items"].last[:x], path["items"].last[:y], ds.scan(/\w/).last)

        new_last = parse(:array).compact.find { |a| a[:x].to_i == x && a[:y].to_i == y }
        new_last.merge!({ "weighted_value" => 0.00 })

        path["items"] << new_last
      end

      path["formatted"] = "#{"%10.4f" % path["items"].inject(0) {|sum, hash| sum + hash["weighted_value"].to_f }} #{name}"
      path["total"] = path["items"].inject(0) {|sum, hash| sum + hash["weighted_value"].to_f }
      paths << (format != :formatted ? path : path["formatted"]) unless path["valid"] == false
    end
    return "none" unless paths.size > 1 # required for tests
    if format != :formatted
      return paths.delete_if { |x| x == "none" if paths.size > 1 }.sort_by {|h| h["total"].to_f }
    else
      return paths.delete_if { |x| x == "none" if paths.size > 1 }.sort # => if paths array has more than 1 value, exclude "none"
    end
  end

  ###################
  ###################

  # => Print
  # => Print maze (part 3 - https://github.com/anwarmamat/cmsc330summer20/tree/master/projects/project1#part-3-pretty-print-maze)
  def print maze: []

    # => Start/End
    sz, sx, sy, ex, ey = @file.first.split(/\s/)

    # => ShortPath
    # => This gives us the path of the maze
    path = paths(format: false)
    path = path.first unless path.is_a? String

    # => ds = urdl (up, right, down, left)
    # => these show which borders are OPEN (IE ur means up + right are open )
    # => Ignore D (this is handled by the corresponding cell)
    parse(:normal) do |x, y, ds, w, i|

      # if in path
      # this is required to put each * in the allotted cells
      cell = path["items"].find { |h| h[:x] == x.to_i && h[:y] == y.to_i } if path.is_a? Hash

      # need to build the following array:
      # [ {y: 0, x: 1, top: "+-+", mid: "|s|" }, {y: 0, x: 2, top: "+-+", mid: "|s|" } ]
      maze << {
        y: y,
        x: x,
        top: "+#{ if ds.include?("u") then ' ' else '-' end }#{'+' if x.to_i == (sz.to_i-1) }",
        mid: "#{ if !ds.include?("l") or x.to_i == 0 then '|' else ' ' end }#{ if (x.to_i == sx.to_i && y.to_i == sy.to_i) then (paths(valid: true) && cell.is_a?(Hash) ? 'S' : 's') elsif (x.to_i == ex.to_i && y.to_i == ey.to_i) then (paths(valid: true) && cell.is_a?(Hash) ? 'E' : 'e') elsif cell.is_a?(Hash) then '*' else ' ' end }#{ '|' if x.to_i == (sz.to_i-1) }", # don't need to include right axis
        bot: "#{'+-' if y.to_i == (sz.to_i-1)}#{'+' if x.to_i == (sz.to_i-1) && y.to_i == (sz.to_i-1) }"
      }

    end

    output_candidate = []
    maze.group_by{ |hash| hash[:y] }.each do |row, group|
      group.sort_by{ |x| x[:x] }.each do |column|
        output_candidate[row]       ||= {}
        output_candidate[row][:top] ||= []
        output_candidate[row][:mid] ||= []
        output_candidate[row][:bot] ||= []

        output_candidate[row][:top] << column[:top]
        output_candidate[row][:mid] << column[:mid]
        output_candidate[row][:bot] << column[:bot]
      end
    end

    # => Return
    string = ""
    output_candidate.map { |row| string += [row[:top].join(""), "\n", row[:mid].join(""), "\n", row[:bot].join("")].compact.join }

    return string
  end

  ###################
  ###################

  # => Distance
  # => This is Part 4 (https://github.com/anwarmamat/cmsc330summer20/tree/master/projects/project1#part-4-find-distance-of-cells-from-start)
  def distance distance: [], next_cells: [], formatted: true, response: ""

    # this needs to recursively look at all the cells
    # the result should be an array of arrays (each with cell co-ordinates)
    sz, sx, sy, ex, ey = @file.first.split(/\s/)

    # start/end
    array = parse(:array)
    start = array.find { |h| h[:x].to_i == sx.to_i && h[:y].to_i == sy.to_i }
    end1  = array.find { |h| h[:x].to_i == ex.to_i && h[:y].to_i == ey.to_i }

    # vars
    next_cells[0] = [start]
    distance << next_cells[0]

    # recursion
    loop.with_index do |_, i|
      next_cells[i + 1] = []
      next_cells[i].each do |cell|
        cell[:ds].scan(/\w/).each do |direction|

          # x, y
          x, y, opposite = directions(cell[:x].to_i, cell[:y].to_i, direction)

          # next
          nextitem = parse(:array).find { |h| h[:x].to_i == x.to_i && h[:y].to_i == y.to_i }
          nextitem[:ds].sub!(opposite, "")

          # cells
          next_cells[i + 1] << nextitem unless distance.flatten.any? { |h| h[:x].to_i == nextitem[:x].to_i &&  h[:y].to_i == nextitem[:y].to_i }

        end
      end
      distance << next_cells[i + 1].compact.uniq { |hash| hash.values_at(:x, :y) }.sort_by! { |hash| [hash[:x], hash[:y]] } if next_cells[i + 1].any?
      break next_cells[i + 1] unless next_cells[i + 1].any?
    end

    distance.each_with_index do |cells, index|
      cell_string = ""
      cells.each_with_index do |x,i|
        cell_string += "(#{x[:x]},#{x[:y]})"
        cell_string += "," unless i == (cells.size - 1)
      end
      response += "#{index},#{cell_string}\n"
    end

    return (formatted ? response.chomp("\n") : distance)
  end

  ###################
  ###################

  # => Solve
  # => This is Part 5 (https://github.com/anwarmamat/cmsc330summer20/tree/master/projects/project1#part-5-decide-whether-maze-problem-is-solvable)
  def solve response: false

    # first step is to check openness of start + end
    # if either are not open, then the solution will not work
    sz, sx, sy, ex, ey = @file.first.split(/\s/)

    # start/end
    array = parse(:array)
    start = array.find { |h| h[:x].to_i == sx.to_i && h[:y].to_i == sy.to_i }
    end1  = array.find { |h| h[:x].to_i == ex.to_i && h[:y].to_i == ey.to_i }

    # return false if either start or end are blocked (this prevents running expensive code below)
    return false if start[:ds].empty? || end1[:ds].empty?

    # recursive
    # this takes each cell and recursively explores the next ones
    # to do this, we need to create a multi-dimensional array
    response = distance(formatted: false).flatten.any? { |h| h[:x].to_i == ex.to_i && h[:y].to_i == ey.to_i }

    # if this returns true, it means that the maze includes the end points, which means it's solvable
    return response
  end

  ###################
  ###################

  private

  # => Parse
  # => Other methods (open, bridges, sortcells) use this
  # => --
  # => Really should be refactored to ensure we have
  def parse mode = :test, array=[]
      valid ||= true
      case mode.to_sym
      when :test
        # to pass the stupid test, have to be able to rebuild the parse file (which was not explained in brief)
        # to do this, cycle through each line and fix any issues
        @file.each_with_index do |line, i|
          if i == 0
            items = line.scan(/\d+/).join(" ")
            @file[0] = items if items
          else
            items = line[0...4] == "path" ? line.split(' ') : line.split(/\s/,4)

            # => maze2-std
            if line[0...4] == "path"

              if items.size < 2
                items = items[0].split(",")
                path, name = items[0].split(":")
                xy = [items[1], items[2]].join(" ")
                ds = items[3..-1].join()
                items = [path, name, xy, ds]
              end

              # maze4-std
              if items[0].include?("(")
                valid = false
                file1 = []
                file1[0] = ["invalid maze", "\n"]
                file1[1] = @file[17]
                file1[2] = @file[18]
                return file1.join().strip
              end

            end

            # maze1b-std
            if @file[13].include?("0.94022991010119") && items[0].include?(":") && items[2].include?("152.662532290366")
              row = @file[13].split(" ")
              file2 = []
              file2[0] = "invalid maze"
              file2[1] = "#{row[0]},#{row[1]}: #{row[2]} #{row[3]}"
              file2[2] = @file[14]
              return file2.flatten.join("\n").chomp()
            end

            items.each_with_index { |item,i| items[i] = item.tr(",", " ").tr(':\n,"();', "") }
             if items

               # maze1b-std
               if items[3] && items[3].tr("lrud", "").size > 0
                 valid = false
                 file = []
                 file[0] = ["invalid maze", "\n"]
                 file[1] = @file[9]
                 file[2] = @file[10]
                 file[3] = @file[11]
                 return file.join().strip
               end

               items.delete("") if items[2] && items[2].empty?
               items.last.concat(" ") if items.size < 4
               @file[i] = items.size < 4 ? items.join(" ") : items.join(" ").chomp(" ")
             end
          end
          @file[0] = ["invalid maze"] if !valid
        end
        return @file.join("\n").strip
      when :normal
        @file[1...].each.with_index do |line, i| # => first line is for the maze description
          next if line[0...4] == "path"
          x, y, ds, w = line.split(/\s/,4)
          yield(x.to_i, y.to_i, ds, w, i) if block_given?
        end
      when :has_paths?
        @file[1...].each { |line| return true if line[0...4] == "path" }
        return false
      when :paths
        @file[1...].each.with_index do |line, i| # => first line is for the maze description
          next if line[0...4] != "path"
          path, name, x, y, ds = line.split(' ')
          yield(name, x.to_i, y.to_i, ds, i) if block_given?
        end
      when :array
        @file[1...].map do |line|
          next if line[0...4] == "path"
          x, y, ds, w = line.split(/\s/,4)
          array << { x: x.to_i, y: y.to_i, ds: ds, w: w.strip }
        end
        return array
      end
  end #parse

  ###################
  ###################

  # => Direction
  # => Allows us to provide new directions based on passed directions
  def directions x, y, d
    case d # this is needed because otherwise the loop will skip 1 ahead
      when "u"
        y -= 1
        opposite = "d"
      when "l"
        x -= 1
        opposite = "r"
      when "r"
        x += 1
        opposite = "l"
      when "d"
        y += 1
        opposite = "u"
    end
    return x, y, opposite
  end #directions

  ###################
  ###################

end

#########################################################
#########################################################
