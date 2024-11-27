defmodule Demo do
  def run(n) do
    if n > 20 do
      true
    else
      false # false / nil == false
    end

    unless n > 100, do: false, else: true
  end

  def check(n) do
    result = cond do
      n > 100 -> "large"
      n <= 100 and n >= 50 -> "avg"
      n > 20 and n < 50 -> "small"
      true -> "tiny"
    end

    result
  end

  def switch(n) do
    result = case n > 100 do
      true -> "large"
      false -> "small"
    end

    result
  end
end

Demo.run(52) |> IO.puts()
Demo.check(52) |> IO.puts()
Demo.switch(52) |> IO.puts()
