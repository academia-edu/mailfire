require 'tinder'

require "mailfire/version"

module Mailfire

  class TextToRoom

    attr_reader :campfire, :rooms
    attr_accessor :config

    def initialize(opts={})
      @config = opts
      if opts[:room]
        @config[:rooms] = [opts[:room]]
      end
      @config[:rooms].map!(&:downcase)

      raise ArgumentError, 'No :account provided' if @config[:account].nil?
      raise ArgumentError, 'No :token provided' if @config[:token].nil?
      if @config[:rooms].nil? or @config[:rooms].empty?
        raise ArgumentError, 'No :room or :rooms provided'
      end

      connect_to_campfire
      select_rooms
    end

    def connect_to_campfire
      @campfire = Tinder::Campfire.new @config[:account], token: @config[:token]
    end

    def select_rooms
      @rooms = @campfire.rooms.select do |room|
        @config[:rooms].include? room.name.downcase
      end
    end
    
    def deliver!(mail)
      @rooms.each do |room|
        room.speak "To: #{mail.to}, From: #{mail.from}"
        room.speak mail.subject
        room.paste mail.text_part.to_s
      end
    end
  
  end

end
