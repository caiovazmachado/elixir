defmodule Inmana do
  alias Inmana.Restaurants.Create, as: RestauranteCreate
  alias Inmana.Supplies.Create, as: SupplyCreate
  alias Inmana.Supplies.Get, as: SupplyGet

  defdelegate create_restaurante(params), to: RestauranteCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end
