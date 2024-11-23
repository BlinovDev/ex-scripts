defmodule Demo do
  def ask_for_number do
    IO.gets("Please, enter a bunber:")
    |> Integer.parse()
    |> check_input
  end

  def check_input(:error), do: ask_for_number()

  def check_input({num, _}), do: num
end

Demo.ask_for_number() |> IO.puts()
