hi = fn({name, msg}) -> IO.puts("#{name}: #{msg}") end

hi.({"Obi Wan", "Hello there"})

defmodule Demo do
  def map(list, func), do: do_map([], list, func) |> Enum.reverse()

  defp do_map(new_list, [], _), do: new_list

  defp do_map(new_list, [ head | tail ], func) do
    [ func.(head) | new_list ] |> do_map(tail, func)
  end
end

handler = fn
  x when is_number(x) -> x*2
  _ -> nil
end

[1, 2, 3, "cat"] |> Demo.map(handler) |> IO.inspect()
