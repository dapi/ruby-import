# Copyright (c) 2018 Danil Pismenny <danil@brandymint.ru>

# frozen_string_literal: true

require 'test_helper'

class ImportTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Import::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
