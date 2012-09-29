require 'twitter_console'

class CommandLine

  def initialize(input, output, command = nil)
    @input = input
    @output = output
    @command = command
  end

  def run
    command = @command == nil ? nil : @command.split(" ").first
    case command
    when "-t"
      tweet
    else
      usage
    end
  end

  def tweet
    
    @output.puts "Yay! you have posted a tweet!"
  end

  private

  def authentication
    @output.puts """ """
  end

  def usage
    @output.puts """Usage: tw [OPTION] [MESSAGE]
OPTIONS:
  -t tweet # Post a tweet
  -r recent # Returns the most recent tweets
  -fw followeres # Returns the followers
  -fg followigs # Returns the followings
  -u usages # Usage
  -a authentication # Returns the authorization usages"""
  end
end
