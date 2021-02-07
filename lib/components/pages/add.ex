defmodule Pages.Add do

  import Ratatouille.View
  alias Organisms.Navigation, as: Navigation
  alias Organisms.Content, as: Content
  require Ui

  def render(model) do
    view do
      Navigation.render(Ui.tab_add) 
      Content.render(model.tab, model.input)
    end
  end
end