defmodule Birthdays.Server do
  def run do
    spawn(fn -> loop(%{}) end) |> Process.register(:main)
  end

  def loop(state) do
    new_state = receive do
      msg -> process_message(state, msg)
    end

    loop(new_state)
  end

  defp process_message(state, { :add, name, birthday }) do
    state |> Map.put(name, birthday)
  end

  defp process_message(state, { :all, caller }) do
    caller |> send({ :response, state })
    state # return state cause we want our loop to continue
  end

  defp process_message(state, { :get, caller, name }) do
    caller |> send({ :response, state[name] })
    state # return state cause we want our loop to continue
  end

  defp process_message(state, { :delete, name }) do
    state |> Map.delete(name)
  end
end

defmodule Birthdays.Client do
  def all do
    do_send({ :all, self() })
    get_responce()
  end

  def get(name) do
    do_send({ :get, self(), name })
    get_responce()
  end

  def add(name, birthday), do: do_send({ :add, name, birthday })

  def delete(name), do: do_send({ :delete, name })

  defp do_send(msg), do: send(:main, msg)

  defp get_responce do
    receive do
      { :response, data } -> data # IO.inspect(data)
      _ -> :error
      after 3000 -> IO.puts("Timeout")
    end
  end
end

Birthdays.Server.run

Birthdays.Client.all |> IO.inspect

Birthdays.Client.add("Jane", "29 May")
Birthdays.Client.add("Bob", "5 June")
Birthdays.Client.add("Bob", "5 July")

Birthdays.Client.all |> IO.inspect

Birthdays.Client.get("Bob") |> IO.inspect
Birthdays.Client.add("Jim", "1 December")

Birthdays.Client.all |> IO.inspect
Birthdays.Client.delete("Jim")
Birthdays.Client.add("Joanne", "1 December")

Birthdays.Client.all |> IO.inspect

# Add validation of incorrect message from the Client
# Add :shutdown mechanism
