defmodule FridgeServerTest do
  use ExUnit.Case
  doctest FridgeServer

  test "putting something into the fridge" do
    fridge = FridgeServer.start_link []
    assert :ok == FridgeServer.store fridge, :bacon
  end

  test "taking something from the fridge" do
    fridge = FridgeServer.start_link []
    FridgeServer.store fridge, :bacon
    assert {:ok, :bacon} == FridgeServer.take fridge, :bacon
  end

  test "item is removed from the fridge" do
    fridge = FridgeServer.start_link []
    FridgeServer.store fridge, :bacon
    {:ok, :bacon} == FridgeServer.take fridge, :bacon
    assert :not_found == FridgeServer.take fridge, :bacon
  end

  test "removing something from the fridge that isn't there" do
    fridge = FridgeServer.start_link []
    assert :not_found == FridgeServer.take fridge, :bacon
  end
end
