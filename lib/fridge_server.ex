defmodule FridgeServer do
  use GenServer

  ### Public API

  def start_link(items) do
    {:ok, fridge} = :gen_server.start_link FridgeServer, [], []
    fridge
  end

  def store(fridge, item) do
    :gen_server.call fridge, {:store, item}
  end

  def take(fridge, item) do
    :gen_server.call fridge, {:take, item}
  end

  ### GenServer API

  def init(items) do
    { :ok, items }
  end

  def handle_call({:store, item}, _from, items) do
    {:reply, :ok, [item | items]}
  end

  def handle_call({:take, item}, _from, items) do
    case Enum.member?(items, item) do
      true  -> {:reply, {:ok, item}, List.delete(items, item)}
      false -> {:reply, :not_found, items}
    end
  end
end
