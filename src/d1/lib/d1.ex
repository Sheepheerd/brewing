defmodule D1 do
  @moduledoc """
  Documentation for `D1`.
  """

  @doc """
  CLI Temperature Converter

  ## Examples

      iex> D1.f_to_c("32")
      0.0

  """
  def f_to_c(temp_str) do
    str = String.trim(temp_str)

    case Integer.parse(str) do
      {int, ""} ->
        convert(int)

      _ ->
        case Float.parse(str) do
          {float, ""} -> convert(float)
          _ -> IO.puts("Invalid number")
        end
    end
  end

  def convert(f) do
    (f - 32) * 5 / 9
  end
end
