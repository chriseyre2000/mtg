# Mtg

This is a calculator to work out how much land to put in a deck.

For example with a deck with 20 land and 40 spells the starting hand will have 2..5 land 75.76% of the time.


Mtg.build_deck(land: 20, spell: 40) |> Mtg.percent_in_range(:land, 10_000, 2..5)

```
histogram: %{
  1 => 1903,
  2 => 3187,
  3 => 2827,
  4 => 1252,
  5 => 310,
  6 => 41,
  7 => 2,
  nil => 478
}
75.76
```
