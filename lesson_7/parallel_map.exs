defmodule Demo do
  def pmap(n) do
    (1..n) |> Enum.map(&Demo.do_spawn/1) |> Enum.map(&Demo.do_receive/1)
  end

  def do_spawn(elem) do
    function = &(&1 * &1)

    spawn_link Demo, :calc, [ self(), function, elem ]
  end

  def calc(curr_proc, function, elem) do
    send curr_proc, { self(), function.(elem) }
  end

  def do_receive(pid) do
    receive do
      { ^pid, result } -> result

      after 1000 -> nil
    end
  end

  def run(n) do
    { ms, res } = :timer.tc(Demo, :pmap, [n])
    { ms / 1000, res }
  end

  def sleep(duration) do
    :timer.sleep(duration * 1000)
  end
end

# elixir -r parallel_map.exs -e "Demo.run(10_000_000) |> IO.inspect()"
