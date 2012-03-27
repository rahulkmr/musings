#!/usr/bin/env ruby

module Cron
  # Converts ruby datetime to cron's when string.
  def datetime_to_cron(datetime)
    "#{datetime.min} #{datetime.hour} #{datetime.day} #{datetime.month} #{datetime.wday}"
  end

  # Represents a cron entry.
  class Entry
    attr_accessor :command, :entry_id, :hour, :min, :day, :month, :wday

    @@entry_sep = '@'
    @@when_format = /
      \s* (?<hour>.+?) \s+ (?<min>.+?) \s+ (?<day>.+?) \s+ (?<month>.+?) \s+ (?<wday>.+?)
      /ox
    @@cron_format = /
      #{@@when_format} \s+
      (?<command>.+) \s*
      \# \s* #{@@entry_sep} \s* (?<entry_id>.+) \s* #{@@entry_sep}
      /ox

    def initialize(cron_line=nil)
      init_from_cronline(cron_line) if cron_line
    end

    def init_from_cronline(cron_line)
      @@cron_format.match(cron_line) do |data|
        @hour, @min, @day, @month, @wday, @command, @entry_id = data[:hour], data[:min], data[:day],
          data[:month], data[:wday], data[:command].trim, data[:entry_id].trim
      end
    end

    def when
      "#@hour #@min #@day #@month #@wday"
    end

    def when=(when_str)
      if not @@when_format =~ when_str
        raise RuntimeError, "Improper when_str format specified"
      else
        @hour, @min, @day, @month, @wday = $~[:hour], $~[:min], $~[:day],
          $~[:month], $~[:wday]
      end
    end

    def to_s
      "#{self.when} #@command # #@@entry_sep #@entry_id #@@entry_sep"
    end
  end

  # Represents crontab file and handles mainpulations.
  class Tab
    def initialize(user=nil)
      @user = user
    end

    def self.add(entry_id, cron_line)
      entry = self.new.add(entry_id, cron_line)
      commit and entry
    end

    def self.remove(entry_id, cron_line)
      self.new.remove(entry_id, cron_line, commit: true)
    end
  end
end
