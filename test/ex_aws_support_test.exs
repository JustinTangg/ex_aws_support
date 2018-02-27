defmodule ExAwsSupportTest do
  use ExUnit.Case
  doctest ExAwsSupport

  test "greets the world" do
    assert ExAwsSupport.hello() == :world
  end
end
