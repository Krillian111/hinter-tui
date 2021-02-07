defmodule Hinter do
  @behaviour Ratatouille.App

  import Ratatouille.View
  alias Repository.Local, as: Repo
  require Ui

  def init(_context) do
    Model.Root.init()
  end

  def update(model, msg) do
    Model.Root.update(model, msg)
  end

  # @tabs %{0 => :add, 1 => :rmv}
  def render(model) do
    view do
      row do
        column(size: 10) do
          menu_item("Add", Ui.tabs[model.tab] == :add)
        end
        column(size: 10) do
          menu_item("Remove", Ui.tabs[model.tab] == :rmv)
        end
      end
      row do
        column(size: 30) do
          label(content: "Tab: #{model.tab}")
          label(content: "Repo: #{Repo.value()}")
          label(content: "Input: #{model.input}")
        end
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

Repository.Local.start_link("")
Ratatouille.run(Hinter)




