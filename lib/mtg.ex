defmodule Mtg do
  @moduledoc """
  Documentation for `Mtg`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Mtg.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Deck is a keyword map of card or card_type to count

  deck is a keyword list [land: 20, spell: 40]

  """
  def build_deck(deck) do
    deck |> Enum.map(fn {a, b} -> Stream.cycle([a]) |> Enum.take(b) end) |> List.flatten()
  end

  def shuffle_count(deck, card) do
    deck |> Enum.shuffle() |> Enum.take(7) |> Enum.frequencies() |> Map.get(card)
  end

  def histogram(deck, card, times) do
    1..times
    |> Enum.map(fn _ ->
      deck |> Enum.shuffle() |> Enum.take(7) |> Enum.frequencies() |> Map.get(card)
    end)
    |> Enum.frequencies()
  end

  @doc """
  How frequently will this mix of cards give the required number of a given card type.

  range is inclusive
  """
  def percent_in_range(deck, card, times \\ 10_000, range) do
    histogram(deck, card, times)
    |> Enum.map(fn
      {nil, value} -> {0, value}
      {k, v} -> {k, v}
    end)
    |> IO.inspect(label: :histogram)
    |> Enum.filter(fn {k, _} -> Enum.member?(range, k) end)
    |> Enum.map(&elem(&1, 1))
    |> Enum.sum()
    |> Enum.then(&(&1 * 100 / times))
  end
end
