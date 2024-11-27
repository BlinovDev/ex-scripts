defmodule Demo do
  def print_num(n, caller) do
    sleep(n)

    send(caller, { :ok, n })
    n
  end

  def sleep(duration) do
    :timer.sleep(duration * 1000)
  end
end

do_async = &( spawn(Demo, :print_num, [&1, self()]) )

fetch_response = fn(_) ->
  receive do
    {:ok, num} -> num

    after 5000 -> nil
  end
end

Enum.each [1, 2, 7], do_async

results = Enum.map 1..3, fetch_response

results |> IO.inspect()
