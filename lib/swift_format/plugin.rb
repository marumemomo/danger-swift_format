module Danger
  require "open3"

  # Run swift-format.
  # This is using https://github.com/apple/swift-format
  #
  # @example Run swift-format format
  #          swift_format.binary_path = ".build/x86_64-apple-macosx/release/swift-format"
  #          swift_format.configuration = "swift-format.json"
  #          swift_format.format("Sources/*.swift", true)
  #
  # @see  marumemomo/danger-swift_format
  # @tags swift-format
  #

  class DangerSwiftFormat < Plugin

    # swift-format configuration file path
    #
    # @return   [Array<String>]
    attr_accessor :configuration

    # swift-format binary path
    #
    # @return   [Array<String>]
    attr_accessor :binary_path

    # run swift-format lint
    # @return   [Array<String>]
    #
    def lint(files)
      target = target_file(files)
      return if target.empty?

      o, e, s = Open3.capture3("#{binary_path} lint -r --configuration #{configuration} #{target}")
      return if e == ''
      warn e
    end

    # run swift-format format
    # @return   [Array<String>]
    #
    def format(files, in_place = false)
      in_place_option = "-i"
      in_place_option = '' if !in_place

      target = target_file(files)
      return if target.empty?

      o, e, s = Open3.capture3("#{binary_path} format -r #{in_place_option} --configuration #{configuration} #{target}")
      return if e == ''
      warn e
    end

    def target_file(files)
      target_files = []
      
      if files.instance_of?(String)
        target_files = files.split(' ')
      else
        target_files = files
      end

      target_files.select { |f| f.include? '.swift' } .join(' ')
    end
  end
end
