# Copyright (c) 2018 Danil Pismenny <danil@brandymint.ru>

# frozen_string_literal: true

require 'test_helper'

class RubyImportTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RubyImport::VERSION
  end

  def test_import_and_call_imported_method
    u = import './test/dummy/module1.rb'
    assert u.sum(1, 2)
  end

  def test_double_import_does_not_fall
    u = import './test/dummy/module1.rb'
    assert u.sum(1, 2)

    u = import './test/dummy/module1.rb'
    assert u.sum(1, 2)
  end
end
