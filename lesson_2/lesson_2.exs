# type matching

employee = { "Alice", "mslalfjhlkjhmn" }

name = "Alice"

{ ^name, key } = employee

key |> IO.puts()

# atoms

(true == :true) |> IO.puts()

(false == :false) |> IO.puts()

(nil == :nil) |> IO.puts()

a = :atom

b = :atom

(a == b) |> IO.puts()

# Strings

# Binary string
"Hello world" |> IO.puts()

# chars sequens(do not use without solid need)
~c"Hello world" |> IO.puts()

[104, 101, 108, 108, 111] |> IO.puts()


# Reinit

a = 10

a = 20 # works fine

# ^a = 20 # causes error

a |> IO.puts()
