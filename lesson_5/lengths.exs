arr = ["cat", "elephant", "human"]

arr |> Enum.map(&String.length/1) |> IO.inspect()

arr |> Enum.filter(
  &(String.length(&1) >= 5)
)|> IO.inspect()

# closure
num = 10

handler = &(&1 * num) # num = 10 is fixed

handler.(2)|> IO.inspect()

num = 0

handler.(3)|> IO.inspect()
