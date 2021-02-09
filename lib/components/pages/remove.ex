defmodule Hinter.Pages.Remove do
  import Ratatouille.View
  alias Hinter.Organisms.Navigation, as: Navigation
  alias Hinter.Organisms.Content, as: Content
  require Hinter.Ui

  def render(model) do
    view do
      Navigation.render(Hinter.Ui.tab_rmv())
      Content.render(model.tab_index, model.input)
    end
  end
end
