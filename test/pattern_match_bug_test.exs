defmodule PatternMatchBugTest do
  use ExUnit.Case
  import PatternMatchBug

  test "parses decimal types" do
    value = Decimal.new(1, 10, -1)
    assert value == translate_value({1, "decimal(2,1)"})
  end
end
