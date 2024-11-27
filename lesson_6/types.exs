defmodule Demo do
  @default_opts [ mode: "r", filename: "demo.txt" ]

  def run(_arg, opts \\ []) do
    Keyword.merge(@default_opts, opts)
  end
end

# Demo.run(52, [ user: "Anton", mode: "a+" ]) |> IO.inspect()

# ComplexStruct
# Structs are specific maps(m = %{name: "Anton", age: 22} # any keys values possible)
# For struct keys are predefined in module
defmodule Car do
  defstruct brand: "BMW",
            model: "M2",
            year: 2019,
            color: "white"

  def init do
    %Car{}
  end

  def show(car = %Car{brand: brand, model: model}) when brand != "" and model != "" do
    "#{car.brand} #{car.model}" |> IO.puts()
  end
end

defmodule Brand do
  defstruct title: "",
            models: [],
            flagman: %Car{}
end

car = Car.init()
car |> IO.inspect()

car |> Car.show()
