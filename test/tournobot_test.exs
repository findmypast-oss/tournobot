defmodule TournobotTest do
  use ExUnit.Case
  doctest Tournobot

  test "greets the world" do
    assert Tournobot.hello() == :world
  end
end
