creation_date = fn
  "elixir" -> 2011
  "ruby" -> 1995
  "c++" -> 1985
  lang when is_bitstring(lang) -> "Not sure about #{lang}..."
  _ -> nil
end

creation_date.("ruby") |> IO.puts()

creation_date.("erlang") |> IO.puts()
