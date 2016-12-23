defmodule Sqlitex.RowTest do
  use ExUnit.Case
  import Sqlitex.Row

  test "parses decimal types" do
    value = Decimal.new(1, 10, -1)
    assert [{:cost, value}] == translate_value({1, "decimal(2,1)"})
  end
end
