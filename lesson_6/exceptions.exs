defmodule Demo do
  def run() do
    # 1 / 0
    # { :ok, _io_dev } = File.open("demo.txt")
    raise "ERROR"
  rescue
    error in ArithmeticError -> IO.inspect(error)
    MatchError -> IO.puts("Cannot open file!")
    error in RuntimeError -> IO.inspect(error.message)
  end
end

Demo.run()

# Alternative to rescue is approach "let it fail"
