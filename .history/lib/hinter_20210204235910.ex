defmodule Counter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  def init(_context), do: ""

  def update(model, msg) do
    case msg do
      {:event, %{ch: ?+}} -> model <> "+"
      {:event, %{ch: ?-}} -> model <> "-"
      _ -> model
    end
  end

  def render(model) do
    view do
      row do
        label(content: "Add")
        label(content: "Remove")
      end
      row do
        label(content: "Main area")
      end
    end
  end
end

Ratatouille.run(Counter)



