# Numbers
i_1 = 1
f_1 = 3.14
h_1 = 0xfa

# IO.puts(a)

defmodule Main do
  def modify(str) do
    str |> String.upcase()
  end
end

hello = "Hello World!"

hello |> Main.modify() |> IO.puts()


# Keyword list
list = [name: "Anton", age: 22]

list |> Keyword.get(:name) |> IO.puts()
# list |> Keyword.get(:age) |> IO.puts()


# Maps
data = %{ "title" => "Elixir", "emerged" => 2011 }

data["title"] |> IO.puts()
