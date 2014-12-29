defmodule FridgeServer do
  use GenServer

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
