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
    if @@imported_files.key? file
      defined_module =  @@imported_files[file]
    else
      current_constants = Object.constants.dup
      require file
      defined_constants = Object.constants - current_constants

      # TODO: error if there are more than one constant is defined
      # TODO error is defined constant is not subcpass of Importable
      defined_module = defined_constants.first
      @@imported_files[file] = defined_module
    end

    Class.new { include const_get defined_module }.new
  end
end
# rubocop:enable Style/ClassVars

Object.include RubyImport
