defmodule MtgTest do
  use ExUnit.Case
  doctest Mtg

  test "greets the world" do
    assert Mtg.hello() == :world
  end
end
