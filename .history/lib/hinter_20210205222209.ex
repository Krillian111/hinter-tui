defmodule Counter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  @tabs {:add, :remove}

  def init(_context), do
    %{tabIndex: 0}
  end

  def update(model, msg) do
    case msg do
      {:event, %{key: key(:left)}} ->
        %{tabIndex: rem(model[tabIndex]-1,tuple_size(@tabs))}
      {:event, %{key: key(:right)}} ->
        %{tabIndex: rem(model[tabIndex]+1,tuple_size(@tabs))}
      _ -> model
    end
  end

  def render(model) do
    active = %s{color => :black, background => :white }
    inactive = %s{color => :white, background => :black }
    addActive = elem(@tabs, model[tabIndex]) == :add
    addColor = if addActive, do: active[color], else: inactive[color]
    addBg = if addActive, do: active[background], else: inactive[background] 
    removeActive = elem(@tabs, model[tabIndex]) == :remove 
    removeColor = if removeActive, do: active[color], else: inactive[color] 
    addBg = if removeActive, do: active[background], else: inactive[background] 
    view do
      row do
        column(size: 10) do
          label(content: "Add", color: adActive , background: :black)
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



