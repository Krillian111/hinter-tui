defmodule Counter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  @tabs {:add, :remove}

  def init(_context) do
    %{:tabIndex => 0}
  end

  def update(model, msg) do
    case msg do
      {:event, %{key: ?1}} ->
        %{:tabIndex => rem(model[:tabIndex]-1,tuple_size(@tabs))}
      {:event, %{key: ?2}} ->
        %{:tabIndex => rem(model[:tabIndex]+1,tuple_size(@tabs))}
      _ -> model
    end
  end

  def render(model) do
    active = %{:color => :black, :bg => :white }
    inactive = %{:color => :white, :bg => :black }
    addActive = elem(@tabs, model[:tabIndex]) == :add
    addColor = if addActive, do: active[:color], else: inactive[:color]
    addBg = if addActive, do: active[:bg], else: inactive[:bg] 
    removeActive = elem(@tabs, model[:tabIndex]) == :remove 
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
          label(content: "Main area")
        end
      end
    end
  end
end

Ratatouille.run(Counter)



