defmodule Repository.Local do
  use Agent

  def start_link(_initial_value) do
    Agent.start_link(fn -> %{0 => "", 1 => ""} end, name: __MODULE__)
  end

  def value(key) do
    Agent.get(__MODULE__, fn hints -> hints[key] end)
  end

  def add_hint(key, value) do
    Agent.update(__MODULE__, fn hints -> %{hints | key => value} end)
  end
end
