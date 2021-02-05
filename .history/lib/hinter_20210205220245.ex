defmodule Counter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  @tabs {:add, :remove}

  def init(_context), do
    %{tab: elem(@tabs,1)}
  end

  def update(model, msg) do
    case msg do
      {:event, %{key: key(:left)}} when key in @delete_keys ->
        String.slice(model, 0..-2)
      # {:event, %{ch: ?+}} -> model <> "+" // this was with strings
      # {:event, %{ch: ?-}} -> model <> "-"
      _ -> model
    end
  end

  def render(model) do
    # active = %s{color => :black, background => :white }
    # inactive = %s{color => :white, background => :black }
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



