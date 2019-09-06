# frozen_string_literal: true

# Copyright (c) 2018 Danil Pismenny <danil@brandymint.ru>

module TestModule
  def sum(arg1, arg2)
    arg1 + arg2
  end

  def dirty_method
    @some = 1
  end
end
