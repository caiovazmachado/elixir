defmodule Inmana do
  alias Inmana.Restaurants.Create

  defdelegate create_restaurante(params), to: Create, as: :call
end
