# head --> 1st list elem
# tail --> all other elements

list = [1, 2, 3, 4, 5]
# hd list -> 1
# tl list -> [2, 3, 4, 5]

# [ head | tail ] = list
# [ head | [ nested_head | nested_tail ] ] = list

# [1, 2] == [ 1 | [ 2 | [] ] ] -> true


# tail-call optimisation(auto then last step is function call)
defmodule CustomList do
  def iterate([]), do: nil

  def iterate([ head | tail ]) do
    head |> IO.puts()

    tail |> iterate() # function call
  end

  # non-optimised size
  def size([]), do: 0

  def size([ _head | tail ]), do: 1 + size(tail)

  # optimised size
  def size_opt(list), do: do_size_opt(list, 0)

  defp do_size_opt([], counter), do: counter

  defp do_size_opt([ _head | tail ], counter) do
    do_size_opt(tail, counter + 1)
  end

  # span/2
  def span(from, to), do: do_span([], from, to)

  defp do_span(list, from, to) when from > to, do: list

  defp do_span(list, from, to) do
    do_span([ to | list ], from, to - 1)
  end

  # max/1
  def max(list), do: do_max(list, 0)

  defp do_max([ head | tail ], c_max) when head > c_max do
    do_max(tail, head)
  end

  defp do_max([ head | tail ], c_max) do
    do_max(tail, c_max)
  end

  defp do_max([], c_max), do: c_max

  # max/1 from lesson
  def maximum([ value | [ head | tail ]]) when value < head do
    maximum([ head | tail ])
  end

  def maximum([ value | [ head | tail ]]) when value >= head do
    maximum([ value | tail ])
  end

  def maximum([ value ]), do: value

  # keep_odd/1
  def keep_odd(list), do: list
  # делим на 2 и потом сравниваем с преобразованием к int(Integer.parse())
end

# [1, 2, 3, 4] |> CustomList.iterate()

[1, 2, 3, 4] |> CustomList.size() |> IO.puts()

[1, 2, 3, 4, 5] |> CustomList.size_opt() |> IO.puts()

CustomList.span(1, 10) |> IO.inspect()

[10, 2, 3, 4, 5] |> CustomList.max() |> IO.puts()

[1, 20, 20, 4, 5] |> CustomList.maximum() |> IO.puts()
