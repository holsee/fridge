Fridge
======

Simple demo to show creating an OTP GenServer in Elixir which has a pretty API for storing and taking items from a _fridge_.

``` elixir
    fridge = FridgeServer.start_link []
    FridgeServer.store fridge, :bacon
    {:ok, :bacon} == FridgeServer.take fridge, :bacon
    :not_found == FridgeServer.take fridge, :bacon
```