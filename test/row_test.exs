defmodule Sqlitex.RowTest do
  use ExUnit.Case
  import Sqlitex.Row

  test "parses decimal types" do
    [row] = from([:"DECIMAL(2,1)"], [:cost], [{1}], [])
    value = Decimal.new(1, 10, -1)
    assert [{:cost, value}] == row
  end
end
