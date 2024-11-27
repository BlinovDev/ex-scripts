defmodule Demo do
  def print_num do
    IO.puts("Work hard...")

    exit(:error) # :normal
  end

  def sleep(duration) do
    :timer.sleep(duration * 1000)
  end
end

Process.flag(:trap_exit, true)

spawn_link Demo, :print_num, []

# Demo.sleep(1)
# IO.puts("Continue to work hard...")

receive do
  msg -> IO.puts "Linked process returned #{inspect(msg)}"
end
