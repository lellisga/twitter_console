require 'twitter_console'

class CommandLine
  VALID_INPUT = ["-t", "-r", "-fw", "-fg", "-u", "-a"]
  def initialize(input, output, command = [])
    @input = input
    @output = output
    @command = command[0]
    validate_command @command
    @message = command[1]
  end

  def test
    p @command
  end
  
  def run
    case @command
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
  
  def validate_command command
    if !VALID_INPUT.include? command
      usage
      exit(0)
    end
  end

  def authentication
    @output.puts """ """
  end

  def usage
    @output.puts """Usage: tw [OPTION] [MESSAGE]
OPTIONS:
  -t tweet          # Post a tweet
  -r recent         # Returns the most recent tweets
  -fw followeres    # Returns the followers
  -fg followigs     # Returns the followings
  -u usages         # Usage
  -a authentication # Returns the authorization usages"""
  end
end

class InputException < Exception
end
