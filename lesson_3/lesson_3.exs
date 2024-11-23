# Pattern matching
defmodule Demo do
    def say_hello do
      "Hello" |> IO.puts()
    end

    def random(max) do
        max |> :rand.uniform |> IO.puts()
        # :random.uniform = :rand.uniform # Erlang module direct call
    end
end

defmodule Demo.Nested do
    # import Demo
end

Demo.random(10)


defmodule Person do
    @name "Anton"
    @age 22

    def get_name(), do: @name |> IO.puts()

    def age, do: @age
end

Person.get_name()
Person.age() |> IO.puts()

# Arity(amount of params in function)
defmodule Math do
    def mult(a), do: mult(a, a)

    def mult(a, b), do: a*b

    # def div(a, b \\ 52) do # default value for the arg
    #     a * b |> IO.puts()
    # end

    def div(_a, 0), do: "You cannot process operation X/0"

    def div(a, b) when is_number(a) and is_number(b), do: a/b # when is guard closes

    # GUARD CLOSES SUPPORTS
    # == > < >= <=
    # + - *
    # Bool: and, or, !
    # in
    # ++ <> for arrays or strings
    # is_number is_list is_atom
    # Built-in funcs like abs/1 elem/2 length/1

    # fallback
    def div(_, _), do: "nil"
end

Math.mult(2) |> IO.puts()

Math.mult(2, 4) |> IO.puts()

Math.div(10, 5) |> IO.puts()

Math.div(10, 0) |> IO.puts()

Math.div(10, "test") |> IO.puts()

# Domashka
defmodule Domashka do
    def factorial(1) do
      1
    end

    def factorial(a) when a > 1 do
        a * factorial(a - 1)
    end
end

Domashka.factorial(5) |> IO.puts()
