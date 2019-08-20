defmodule GsTest do
  use ExUnit.Case
  doctest Gs

  test "greets the world" do
    assert Gs.hello() == :world
  end
end
