defmodule Sqlitex.Row do
  def translate_value({:undefined, _type}) do
    nil
  end

  # INTERESTING DETAIL: If I remove the following two clauses, the test passes
  # on OTP 19 on Ubuntu (Travis CI).
  def translate_value({0, "boolean"}), do: false
  def translate_value({1, "boolean"}), do: true

  def translate_value({int, type = <<"decimal", _::binary>>}) when is_integer(int) do
    {result, _} = int |> Integer.to_string |> Float.parse
    translate_value({result, type})
  end
  def translate_value({float, "decimal"}), do: Decimal.new(float)
  def translate_value({float, "decimal(" <> rest}) do
    [precision, scale] = rest |> String.rstrip(?)) |> String.split(",") |> Enum.map(&String.to_integer/1)
    Decimal.with_context %Decimal.Context{precision: precision, rounding: :down}, fn ->
      float |> Float.round(scale) |> Decimal.new |> Decimal.plus
    end
  end

  def translate_value({val, _type}) do
    val
  end
end
