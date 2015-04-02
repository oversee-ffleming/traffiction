require "traffiction/version"
require 'ruby-progressbar'
require 'httparty'
module Traffiction
  class << self
    # Generates threads, runs the sweep, and returns
    # @param [Hash] Parameters hash of the following format:
    #     threads: Fixnum, number of threads to create
    #     count:   Fixnum, number of times to visit the site
    #     url:     String, url to visit
    #     port:    Fixnum, port
    #     verbose: Boolean, whether to print verbose output
    # @return nil
    def generate(options={})
      @options = options
      puts "#{visits_array.count} threads will be created with visit distribution #{visits_array}" if options[:verbose]
      visits_array.each do |times|
        threads.push Thread.new { visit("#{options[:url]}:#{options[:port]}", times) }
      end
      begin
        threads.each { |t| t.join }
      rescue => e
        abort "#{e}"
      end
    end

    private
    attr_reader :options

    def progress_bar
      @progress_bar ||= ProgressBar.create(
        title: "Visits",
        total: options[:count],
        format: '|%B| %E',
        width: 20,
        progress_mark: '='
      )
    end

    def threads
      @threads ||= []
    end

    def visit(url_string, times=1)
      (1..times).map do
        progress_bar.increment
        HTTParty.get("http://#{url_string}")
      end
    end

    def visits_array
      return @visits_array unless @visits_array.nil?
      ret = Array.new(options[:threads], 0)
      (1..options[:count]).map do |i|
        ret[i % options[:threads]] += 1
      end
      @visits_array = ret.select { |el| el > 0 }
    end
  end
end
