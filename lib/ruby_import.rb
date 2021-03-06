# Copyright (c) 2018 Danil Pismenny <danil@brandymint.ru>

# frozen_string_literal: true

require 'ruby_import/version'

# Implement `import` method
#
# rubocop:disable Style/ClassVars
module RubyImport
  class Error < StandardError; end
  @@imported_files = {}

  def import(file)
    if file.is_a? Module
      defined_module = file
    else
      file += '.rb' unless file.end_with? '.rb'
      file = prepare_file file
      defined_module = @@imported_files[file]
      @@imported_files[file] = defined_module = require_module file unless defined_module

      defined_module = Object.const_get defined_module
    end
    Class.new { include defined_module }.new.freeze
  end

  private

  def require_module(file)
    current_constants = Object.constants.dup
    require file
    defined_constants = Object.constants - current_constants

    raise Error, "Too many constats (#{defined_constants.count}) defined in #{file}" if defined_constants.count > 1
    raise Error, "No module constant defined in #{file}" unless defined_constants.count == 1

    defined_constants.first ||
      raise(Error, "File #{file} does not export any module to import or it is already imported by other filename")
  end

  def find_file_path(file)
    path = $LOAD_PATH.find { |p| File.exist? File.join(p, file) }
    raise LoadError, "cannot find such file -- #{file}" if path.nil?

    File.join(path, file)
  end

  def prepare_file(file)
    if file.start_with?('.') || file.start_with?('/')
      File.expand_path file
    else
      find_file_path file
    end
  end
end
# rubocop:enable Style/ClassVars

Object.include RubyImport
