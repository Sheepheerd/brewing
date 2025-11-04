map = [
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"],
  ["-", "-", "-", "-", "-", "-", "-", "-", "-", "+"]
]

size_x = length(Enum.at(map, 0))

IO.puts("x lenght #{size_x}")

index = Enum.find_index(map |> List.flatten(), fn f -> f == "+" end)

IO.puts("index #{index}")

IO.puts("x: #{rem(index, size_x)}")
IO.puts("y: #{floor(index / size_x)}")

# Improvements

coords =
  Enum.with_index(map)
  |> Enum.find_value(fn {row, y} ->
    case Enum.find_index(row, &(&1 == "+")) do
      nil -> false
      x -> {x, y}
    end
  end)

IO.inspect(coords, label: "Found + at")
