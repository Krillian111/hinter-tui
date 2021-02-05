defmodule Hinter do
  @moduledoc """
  Documentation for `Hinter`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Hinter.hello()
      :world

  """
  def hello do
    :world
  end
end



defmodule Hinter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  def init(_context), do: 0

  def update(model, msg) do
    case msg do
      {:event, %{ch: ?+}} -> model + 1
      {:event, %{ch: ?-}} -> model - 1
      _ -> model
    end
  end

  def render(model) do
    view do
      label(content: "Counter is #{model} (+/-)")
    end
  end
end

Ratatouille.run(Hinter)