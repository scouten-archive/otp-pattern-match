defmodule Sqlitex.Row do
  def from(types, columns, rows, into) do
    for row <- rows do
      build_row(types, columns, row, into)
    end
  end

  defp build_row(types, columns, row, into) do
    types = Enum.map(types, fn type ->
      type |> Atom.to_string |> String.downcase
    end)
    values = row |> Tuple.to_list |> Enum.zip(types) |> Enum.map(&itv/1)

    columns
      |> Enum.zip(values)
      |> Enum.into(into)
  end

  defp itv({value, type}) do
    IO.puts "translate_value{#{inspect value}, #{inspect type} }"
    translate_value({value, type})
  end

  ## Convert SQLite values/types to Elixir types

  defp translate_value({:undefined, _type}) do
    nil
  end

  # INTERESTING DETAIL: If I remove the following two clauses, the test passes
  # on OTP 19 on Ubuntu (Travis CI).
  defp translate_value({0, "boolean"}), do: false
  defp translate_value({1, "boolean"}), do: true

  defp translate_value({int, type = <<"decimal", _::binary>>}) when is_integer(int) do
    {result, _} = int |> Integer.to_string |> Float.parse
    translate_value({result, type})
  end
  defp translate_value({float, "decimal"}), do: Decimal.new(float)
  defp translate_value({float, "decimal(" <> rest}) do
    [precision, scale] = rest |> String.rstrip(?)) |> String.split(",") |> Enum.map(&String.to_integer/1)
    Decimal.with_context %Decimal.Context{precision: precision, rounding: :down}, fn ->
      float |> Float.round(scale) |> Decimal.new |> Decimal.plus
    end
  end

  defp translate_value({val, _type}) do
    val
  end
end
