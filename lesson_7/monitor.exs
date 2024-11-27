defmodule Demo do
  def print_num do
    IO.puts("Work hard...")

    exit(:error) # :normal
  end

  def sleep(duration) do
    :timer.sleep(duration * 1000)
  end
end

spawn_monitor Demo, :print_num, []

receive do
  msg -> IO.puts "Linked process returned #{inspect(msg)}"
end
