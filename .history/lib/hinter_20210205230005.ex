defmodule Counter do
  @behaviour Ratatouille.App

  import Ratatouille.View

  @tabs %{0 => :add, 1 => :rmv}

  def init(_context) do
    %{tab: 0}
  end

  def update(model, msg) do
    case msg do
      {:event, %{ch: ?1}} -> %{model | tab: 0}
      {:event, %{ch: ?2}} -> %{model | tab: 1} 
      _ -> model
    end
  end

  def render(model) do
    active = %{color: :black, bg: :white }
    inactive = %{color: :white, bg: :black }
    addActive = elem(@tabs, model[tab]) == :add
    addColor = if addActive, do: active.color, else: inactive.color
    addBg = if addActive, do: active.bg, else: inactive.bg 
    removeActive = elem(@tabs, model[tab]) == :rmv 
    removeColor = if removeActive, do: active.color, else: inactive.color 
    removeBg = if removeActive, do: active.bg, else: inactive.bg
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


  @menu_color %{active: :black, inactive: :white}
  @menu_bg %{active: :white, inactive: :black}
  def menu_item(label, is_active) do

    label(content: label, )
    active = elem(@tabs, model[tab]) == :add
  end
end

Ratatouille.run(Counter)



