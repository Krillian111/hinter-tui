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
    activeStyling = %s{color => :black, background => :white }
inactiveStyling = %s{color => :black, background => :white }
    view do
      row do
        column(size: 10) do
          label(content: "Add", color: :white, background: :black)
          label(content: "Remove", color: :black, background: :white)
        end
      end
      row do
        column(size: 10) do
          label(content: "Main area")
        end
      end
    end
  end
end

Ratatouille.run(Counter)



