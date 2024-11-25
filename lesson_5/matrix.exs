defmodule Matrix do
  # typewrite
  def typewrite(filename) do
    File.open(filename, [:read])
    |> handle_open()
    # {:ok, io_device} or {:error, reason}
  end


  # handle_open
  defp handle_open({:ok, io_device}) do
    io_device
    |> read_by_line(1) # returns io_device
    |> File.close()
  end

  defp handle_open({:error, reason}), do: reason |> IO.inspect()


  # read_by_line
  defp read_by_line(io_device, line_id) do
    IO.read(io_device, :line) # string or :eof
    |> print_line(io_device, line_id)
  end

  # print_line
  defp print_line(:eof, io_device, _), do: io_device

  defp print_line(string, io_device, line_id) do
    :timer.sleep(500)

    print_line_id(line_id)

    string
    |> String.split("")
    |> Enum.each(&print_char/1)

    io_device |> read_by_line(line_id + 1)
  end


  # print_char
  defp print_char(char) do
    char |> IO.write()
    :timer.sleep(200)
  end


  # print_line_id
  defp print_line_id(line_id) do
    "#{line_id}. " |> IO.write()
  end
end

"matrix.txt" |> Matrix.typewrite()
