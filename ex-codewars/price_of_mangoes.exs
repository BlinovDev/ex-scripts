# There's a "3 for 2" (or "2+1" if you like) offer on mangoes. For a given quantity and price (per mango), calculate the total cost of the mangoes.
defmodule Mango do
  def mango(quantity, price) do
    (quantity - div(quantity, 3)) * price |> IO.puts()
  end
end

Mango.mango(2, 3) # ==> 6    # 2 mangoes for $3 per unit = $6; no mango for free
Mango.mango(3, 3) # ==> 6    # 2 mangoes for $3 per unit = $6; +1 mango for free
Mango.mango(5, 3) # ==> 12   # 4 mangoes for $3 per unit = $12; +1 mango for free
Mango.mango(9, 5) # ==> 30   # 6 mangoes for $5 per unit = $30; +3 mangoes for free
Mango.mango(10, 5)
