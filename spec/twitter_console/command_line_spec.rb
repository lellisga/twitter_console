require 'spec_helper'

describe CommandLine do
  let(:usage){
    """Usage: tw [OPTION] [MESSAGE]
OPTIONS:
  -t tweet # Post a tweet
  -r recent # Returns the most recent tweets
  -fw followeres # Returns the followers
  -fg followigs # Returns the followings
  -u usages # Usage
  -a authentication # Returns the authorization usages"""

  }

  let(:valid_tweet){
    "Yay! you have posted a tweet!"
  }
  before do
    @output = double("output")
    @input = double("input")
  end

  describe "#authentication" do
    
  end
  
  describe "#run" do

    describe "OPTION: -t 'message'" do
      it "post the tweet when the option is valid" do
        @command_line = CommandLine.new(@input, @output, "-t 'message'")
        @output.should_receive(:puts).with(valid_tweet)
        @command_line.run
      end
    end

    describe "OPTION: -u" do
      it "returns the usage when is a valid option" do
        @command_line = CommandLine.new(@input, @output, "-u")
        @output.should_receive(:puts).with(usage)
        @command_line.run
      end

      describe "when theres a invalid command" do
        it "returns the usage when there's no input" do
          @command_line = CommandLine.new(@input, @output)
          @output.should_receive(:puts).with(usage)
          @command_line.run
        end

        it "returns the usage when there's an input" do
          @command_line = CommandLine.new(@input, @output, "invalid")
          @output.should_receive(:puts).with(usage)
          @command_line.run
        end
      end
    end
  end
end
