defmodule HinterTest do
  use ExUnit.Case
  doctest Hinter

  test "greets the world" do
    assert Hinter.hello() == :world
  end
end
