defmodule Counter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  @tabs {:add, :remove}

  def init(_context) do
    %{tab : 0}
  end

  def update(model, msg) do
    case msg do
      {:event, %{key: ?a}} ->
        %{tab : rem(model[tab]-1,tuple_size(@tabs))}
      {:event, %{key: ?d}} ->
        %{tab : rem(model[tab]+1,tuple_size(@tabs))}
      _ -> model
    end
  end

  def render(model) do
    active = %{:color : :black, :bg : :white }
    inactive = %{:color : :white, :bg : :black }
    addActive = elem(@tabs, model[tab]) == :add
    addColor = if addActive, do: active[:color], else: inactive[:color]
    addBg = if addActive, do: active[:bg], else: inactive[:bg] 
    removeActive = elem(@tabs, model[tab]) == :remove 
    removeColor = if removeActive, do: active[:color], else: inactive[:color] 
    removeBg = if removeActive, do: active[:bg], else: inactive[:bg] 
    view do
      row do
        column(size: 10) do
          label(content: "Add", color: addColor , background: addBg)
          label(content: "Remove", color: removeColor, background: removeBg)
        end
      end
      row do
        column(size: 10) do
          label(content: "#{model[tab]}")
        end
      end
    end
  end
end

Ratatouille.run(Counter)



