defmodule Organisms.Content do
  import Ratatouille.View
  alias Repository.Local, as: Repo

  def render(tab, input) do
    row do
      column(size: 30) do
        label(content: "Tab: #{tab}")
        label(content: "Repo: #{Repo.value(tab)}")
        label(content: "Input: #{input}")
      end
    end
  end
end
