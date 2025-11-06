# Sum the values in a column

column = IO.gets("What column do you want to sum?: ") |> String.trim() |> String.to_integer()

# Read in all the lines of the file

file_contents = File.read!("test.csv") |> String.split("\n", trim: true)

total =
  Enum.reduce(file_contents, 0, fn line, acc ->
    columns = String.split(line, ",")
    value = Enum.fetch!(columns, column)

    case Integer.parse(value) do
      {v, _} -> acc + v
      :error -> acc
    end
  end)

IO.puts("Total sum: #{total}")
