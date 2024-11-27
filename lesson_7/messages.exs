defmodule Demo do
  def do_work() do
    IO.puts("Working hard...")

    receive do
      { sender, msg } ->
        IO.inspect(sender)
        IO.puts(msg)
        send(sender, { self(), "Hello there!" })

      after 1000 -> IO.puts("No message in 1 sec!")
    end


  end

  def sleep(duration) do
    :timer.sleep(duration * 1000)
  end
end

pid = spawn(Demo, :do_work, [])
send pid, { self(), "Hello world!" }

receive do
  { sender, msg } ->
    IO.inspect(sender)
    IO.puts(msg)

  after 3000 -> IO.puts("No message in 3 sec!")
end
