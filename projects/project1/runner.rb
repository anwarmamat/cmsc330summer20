#!/usr/imports/bin/ruby

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

# => Load
# => Initializes dependencies (Bundler)
require 'bundler/setup'

# => Pulls in all Gems
# => Replaces the need for individual gems
Bundler.require :default, ENV.fetch("RACK_ENV", 'development') if defined?(Bundler) # => ENVIRONMENT only used here, can do away with constant if necessary

#########################################################
#########################################################

# => Libs
# => Bundler (above) only loads gems etc -- our libs need to be called after this
require_relative 'maze'

#########################################################
#########################################################

## Validation ##
## Cancel if args are not 2... ##
fail "usage: runner.rb <command> <filename>" if ARGV.length != 2

#########################################################
#########################################################

# => Hooks
# => The following can be included in the class itself, but that makes it load every single time
Maze.extend AfterDo

# => Header
# => Felt lile including this, not necessary!
Maze.before [:open, :sortcells, :bridge, :print, :solve, :distance] do |*args, name, object|
    unless object.output
      sz, sx, sy, ex, ey = object.file.first.split(/\s/) # => object = Maze instance
      puts "header spec: size=#{sz}, start=(#{sx},#{sy}), end=(#{ex},#{ey})"
    end
    object.output = true
end

#########################################################
#########################################################

## Go ##
## Why is this echoing the output? ##
puts main ARGV[0], ARGV[1] # => no need to declare variables when you're using them ONCE in a stupid script. Sorry but whoever did this should have been shot.

#########################################################
#########################################################
