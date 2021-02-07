defmodule Organisms.Navigation do
  
  import Ratatouille.View
  require Ui

  def render(active_tab) do
    row do
     column(size: 10) do
        menu_item("Add", active_tab == Ui.tab_add)
      end
      column(size: 10) do
        menu_item("Remove", active_tab == Ui.tab_rmv)
      end
    end
  end

  def menu_item(label, is_active) do
    label(
      content: label,
      color: get_menu_color(is_active), 
      background: get_bg_color(is_active)
    )
  end

  def get_menu_color(is_active) do
    if is_active, do: :black, else: :white
  end
  def get_bg_color(is_active) do
    if is_active, do: :white, else: :black
  end

end