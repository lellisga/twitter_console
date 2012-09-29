require 'twitter'

class CommandLine

  def initialize(input, output, command = nil)
    @input = input
    @output = output
    @command = command
  end

  def run
    command = @command.split(" ").first
    case command
    when "-t"
      tweet
    else
      usage
    end
  end

  def tweet
    message = @command.split(" ").last
    Twitter.update message
    @output.puts "Yay! you have posted a tweet!"
  end

  def usage
    @output.puts """Usage: tw [OPTION] [MESSAGE]
OPTIONS:
  -u usages # Usage
  -t tweet # Post a tweet
  -p posts # Returns a number of tweets
  -fw followeres # Returns the followers
  -fg followigs # Returns the followings"""
  end
end
