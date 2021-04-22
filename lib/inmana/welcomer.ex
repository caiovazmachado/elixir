defmodule Inamna.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special Banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{String.capitalize(name)}"}
  end

  defp evaluate(name, _age) do
    {:error, "You Shaw Not Pass #{String.capitalize(name)}!"}
  end
end
