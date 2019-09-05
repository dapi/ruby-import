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
    file = prepare_file file
    defined_module = @@imported_files[file]

    @@imported_files[file] = defined_module = require_module file unless defined_module

    Class.new { include const_get defined_module }.new
  end

  private

  def require_module(file)
    current_constants = Object.constants.dup
    require file
    defined_constants = Object.constants - current_constants

    # TODO: error if there are more than one constant is defined
    # TODO: error is defined constant is not subcpass of Importable
    defined_constants.first ||
      raise("File #{file} does not export any module to import or it is already imported by other filename")
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
