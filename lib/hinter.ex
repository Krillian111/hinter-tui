defmodule Hinter do
  @behaviour Ratatouille.App

  import Ratatouille.Constants, only: [key: 1]
  import Ratatouille.View
  alias Local.Repository, as: Repo

  @tabs %{0 => :add, 1 => :rmv}
  def init(_context) do
    %{
      tab: 0,
      value: Repo.value(),
      input: ""
    }
  end

  @left key(:arrow_left)
  @right key(:arrow_right)
  @enter key(:enter)
  @spacebar key(:space)
  @backspace key(:backspace)
  def update(model, msg) do
    case msg do
      {:event, %{key: @left}} -> %{model | tab: Integer.mod(model.tab-1,2)}
      {:event, %{key: @right}} -> %{model | tab: Integer.mod(model.tab+1,2)}
      {:event, %{key: @enter}} -> %{model | value: save(model.input)}
      {:event, %{key: @backspace}} -> %{model | input: String.slice(model.input, 0..-2)}
      {:event, %{key: @spacebar}} -> %{model | input: model.input <> " "}
      {:event, %{ch: char}} -> %{model | input: model.input <> <<char::utf8>>}
      _ -> model
    end
  end

  defp save(to_save) do
    Repo.add_hint(to_save)
    to_save
  end

  def render(model) do
    view do
      row do
        column(size: 10) do
          menu_item("Add", @tabs[model.tab] == :add)
        end
        column(size: 10) do
          menu_item("Remove", @tabs[model.tab] == :rmv)
        end
      end
      row do
        column(size: 30) do
          label(content: "Tab:#{model.tab}, Repo#{Repo.value()}")
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

Local.Repository.start_link("o")
Ratatouille.run(Hinter)




